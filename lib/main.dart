import 'package:prakhyan/dropdownselection.dart';
import 'package:prakhyan/info.dart';

import 'splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
