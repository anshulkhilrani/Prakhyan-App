import 'package:prakhyan/dropdownselection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Views extends StatefulWidget {
  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Views"),
      //   backgroundColor: xLightBlue,
      // ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new Text(
                            "Welcome to Info@MUJ",
                            style: new TextStyle(
                              fontSize: 30.0,
                              color: Color(0xff322214),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                  new Container(
                    height: 20,
                  ),
                  StaggeredGridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 12.0,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DropDownSelection(
                              buttonSelection: "Faculty",
                            ),
                          ),
                        ),
                        child: Text("Faculty"),
                      ),
                      RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DropDownSelection(
                              buttonSelection: "Student",
                            ),
                          ),
                        ),
                        child: Text("Student"),
                      ),
                      RaisedButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DropDownSelection(
                                          buttonSelection: "Placement",
                                        )),
                              ),
                          child: Text("Placement")),
                      RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DropDownSelection(
                                    buttonSelection: "Research",
                                  )),
                        ),
                        child: Text("Research"),
                      ),
                      RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DropDownSelection(
                              buttonSelection: "Awards",
                            ),
                          ),
                        ),
                        child: Text("Awards"),
                      ),
                      RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DropDownSelection(
                              buttonSelection: "Functional",
                            ),
                          ),
                        ),
                        child: Text("Functional"),
                      ),
                      RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DropDownSelection(
                              buttonSelection: "Program",
                            ),
                          ),
                        ),
                        child: Text("Program"),
                      ),
                      RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DropDownSelection(
                              buttonSelection: "Statutory Meeting",
                            ),
                          ),
                        ),
                        child: Text("Statutory Meeting"),
                      ),
                    ],
                    staggeredTiles: [
                      StaggeredTile.extent(4, 42.0),
                      StaggeredTile.extent(4, 42.0),
                      StaggeredTile.extent(4, 42.0),
                      StaggeredTile.extent(4, 42.0),
                      StaggeredTile.extent(4, 42.0),
                      StaggeredTile.extent(4, 42.0),
                      StaggeredTile.extent(4, 42.0),
                      StaggeredTile.extent(4, 42.0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
