import 'package:flutter/material.dart';

class InfoDesk extends StatefulWidget {
  @override
  _InfoDeskState createState() => _InfoDeskState();
}

class _InfoDeskState extends State<InfoDesk> {
  Color backgroundColor = Color(0xff1c243c);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What is Flowmodoro?', style: TextStyle(color: Colors.amber[300], fontSize: 40, letterSpacing: 2),),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: backgroundColor,
          child: Column(
            children: [
              RichText(text: TextSpan(
                style: TextStyle(
                  fontSize: 60,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold
                ),
                children: [
                  TextSpan(
                    text: 'Flowmodoro: ',
                    style: TextStyle(
                      color: Colors.amber[300]
                    )
                  ),
                  TextSpan(
                    text: 'Pomodoro Reimagined',
                    style: TextStyle(
                      color: Colors.grey[400]
                    )
                  )

                ]
              )),
              SizedBox(height: 500,)
            ],
          ),
        )
        ),
      );
  }
}
