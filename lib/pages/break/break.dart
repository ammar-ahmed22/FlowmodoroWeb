import 'package:flowmodoro/pages/break/break_desk.dart';
import 'package:flowmodoro/pages/break/break_mobile.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

class Break extends StatefulWidget {
  @override
  _BreakState createState() => _BreakState();
}

class _BreakState extends State<Break> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return BreakDesk();
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return BreakDesk();
      } else {
        return BreakMobile();
      }
    });
  }
}
