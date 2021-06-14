import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prakhyan/info.dart';

// ignore: must_be_immutable
class DropDownSelection extends StatefulWidget {
  DropDownSelection({this.buttonSelection});
  String buttonSelection;
  @override
  _DropDownSelectionState createState() => _DropDownSelectionState();
}

class _DropDownSelectionState extends State<DropDownSelection> {
  String facultySelection;
  String schoolSelection;
  String departmentSelection;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00A6A6),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFFDD4A),
              Color(0xffD96C06),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                    stream: Firestore.instance.collection("faculty").snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List xxx = snapshot.data.documents;
                      return DropdownButton<String>(
                        onTap: () {
                          setState(() {
                            schoolSelection = null;
                            departmentSelection = null;
                          });
                        },
                        value: facultySelection,
                        hint: Text('Choose faculty',),
                        items: xxx.map((value) {
                          return DropdownMenuItem<String>(
                            value: value['faculty'],
                            child: SizedBox( width: 300.0, child:Text(value['display_name'],overflow: TextOverflow.ellipsis,)),
                          );
                        }).toList(),
                        onChanged: (x) {
                          setState(() {
                            facultySelection = x;
                          });
                        },
                      );
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                    stream: Firestore.instance.collection("school").snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List xxx = snapshot.data.documents
                          .where((i) => i['faculty'] == facultySelection)
                          .toList();

                      return DropdownButton<String>(
                        onTap: () {
                          setState(() {
                            departmentSelection = null;
                          });
                        },
                        value: schoolSelection,
                        hint: Text('Choose school'),
                        items: xxx.map((value) {
                          return DropdownMenuItem<String>(
                            value: value['school'],
                            child: SizedBox(width: 300, child: Text(value['display_name'],overflow: TextOverflow.ellipsis,)),
                          );
                        }).toList(),
                        onChanged: (x) {
                          setState(() {
                            schoolSelection = x;
                          });
                        },
                      );
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                    stream:
                        Firestore.instance.collection("department").snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List xxx = snapshot.data.documents
                          .where((i) => i['school'] == schoolSelection)
                          .toList();

                      return DropdownButton<String>(
                        value: departmentSelection,
                        hint: Text('Choose department'),
                        items: xxx.map((value) {
                          return DropdownMenuItem<String>(
                            value: value['department'],
                            child: SizedBox(width: 300,
                                child: Text(value['display_name'],overflow: TextOverflow.ellipsis,)),
                          );
                        }).toList(),
                        onChanged: (x) {
                          setState(() {
                            departmentSelection = x;
                          });
                        },
                      );
                    }),
              ],
            ),
            StreamBuilder(
                stream: Firestore.instance.collection('department').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox();
                  }
                  Map departmentData = departmentSelection != null
                      ? snapshot.data.documents
                          .where((i) => i['department'] == departmentSelection)
                          .toList()[0]
                          .data
                      : null;

                  return RaisedButton(
                    onPressed: departmentSelection != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Information(
                                  button: widget.buttonSelection,
                                  choice: departmentSelection,
                                  graph: widget.buttonSelection == "Placement"
                                      ? 'bar'
                                      : "pie",
                                  xvaluesbar:
                                      departmentData['percentage_placed_x'],
                                  yvaluesbar:
                                      departmentData['percentage_placed_y']
                                          .map((val) => val.round())
                                          .toList(),
                                  graphtitle:
                                      widget.buttonSelection == "Placement"
                                          ? widget.buttonSelection
                                          : "Professors",
                                  xlabel: 'years',
                                  ylabel: 'placement %',
                                  statTitle: widget.buttonSelection == "Placement"
                                      ? "Highest Package in 2019"
                                      : "Total Professors",
                                  statSubtitle: widget.buttonSelection ==
                                          "Placement"
                                      ? "2700000"
                                      : departmentData['total_prof'].toString(),
                                  taskpercentagepie: [
                                    double.parse((departmentData['assoc_prof'] /
                                            departmentData['total_prof'] *
                                            100)
                                        .toStringAsFixed(2)),
                                    double.parse((departmentData['assist_prof'] /
                                            departmentData['total_prof'] *
                                            100)
                                        .toStringAsFixed(2)),
                                    double.parse((departmentData['sen_prof'] /
                                            departmentData['total_prof'] *
                                            100)
                                        .toStringAsFixed(2)),
                                  ],
                                  taskpie: [
                                    'Associate Professors',
                                    'Assistant Professors',
                                    'Senior Professors',
                                  ],
                                ),
                              ),
                            );
                          }
                        : null,
                    child: Text('GO'),
                  );
                })
          ],
        ),
      ),
    );
  }
}
