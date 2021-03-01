import 'dart:async';
import 'package:flowmodoro/pages/home/home_desk.dart';
import 'package:flowmodoro/pages/home/home_mobile.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return HomeDesk();
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return HomeDesk();
      } else {
        return HomeMobile();
      }
    });
  }
}
