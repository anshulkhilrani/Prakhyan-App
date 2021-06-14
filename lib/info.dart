import 'package:flutter/material.dart';
import 'chart.dart';
import 'stats.dart';

class Information extends StatefulWidget {
  Information({
    @required this.button,
    @required this.choice,
    @required this.graph,
    this.taskpercentagepie,
    this.taskpie,
    this.xlabel,
    this.xvaluesbar,
    this.xvaluesline,
    this.ylabel,
    this.yvaluesbar,
    this.yvaluesline,
    this.graphtitle,
    this.statTitle,
    this.statSubtitle,
  });
  String button;
  String choice;
  List<DateTime> xvaluesline;
  List<int> yvaluesline;
  List<dynamic> xvaluesbar;
  List<dynamic> yvaluesbar;
  List<String> taskpie;
  List<double> taskpercentagepie;
  String graph;
  String xlabel;
  String ylabel;
  String graphtitle;
  String statTitle;
  String statSubtitle;
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
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
                Color(0xff00A6A6),
                Color(0xffD96C06),
              ],
            ),
          ),
          child: ListView(
            children: [
              Container(
                height: 450,
                child: ChartBuilder(
                  graph: widget.graph,
                  xlabel: widget.xlabel,
                  ylabel: widget.ylabel,
                  xvaluesline: widget.xvaluesline,
                  yvaluesline: widget.yvaluesline,
                  xvaluesbar: widget.xvaluesbar,
                  yvaluesbar: widget.yvaluesbar,
                  taskpie: widget.taskpie,
                  taskpercentagepie: widget.taskpercentagepie,
                  graphtitle: widget.graphtitle,
                ),
              ),
              Container(
                height: 200,
                child: StatsBuilder(
                  title: widget.statTitle,
                  subtitle: widget.statSubtitle,
                ),
              ),
              Container(
                height: 200,
                child: StatsBuilder(
                  title: "Placement Percentage in 2019",
                  subtitle: "82%",
                ),
              )
            ],
          ),
        ),
      );
  }
}
