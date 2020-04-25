import 'package:flutter/material.dart';
import 'app_screens/homepage.dart';
import 'app_screens/DataSource.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: 'Ubuntu',
        primaryColor: primaryblack
    ),
    home: HomePage(),
  ));
}
