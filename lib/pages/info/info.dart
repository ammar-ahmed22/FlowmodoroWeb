import 'package:flowmodoro/pages/info/info_desk.dart';
import 'package:flowmodoro/pages/info/info_mobile.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return InfoDesk();
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return InfoDesk();
      } else {
        return InfoMobile();
      }
    });
  }
}
