import 'dart:async';
import 'package:flutter/material.dart';

class HomeDesk extends StatefulWidget {
  @override
  _HomeDeskState createState() => _HomeDeskState();
}

class _HomeDeskState extends State<HomeDesk> {
  Color backgroundColor = Color(0xff1c243c);

  bool isTimerStarted = false;
  int tapTracker = 0;
  void _onTapped(int index) {
    setState(() {
      tapTracker++;
      if (index != 0) {
        stopTimer();
      }
    });
  }

  String hourDisplay = '0';
  String minuteDisplay = '0';
  String secondDisplay = '0';

  stopTimer() {
    goToBreak();
    isTimerStarted = isTimerStarted ? false : true;

    if (_timer != null) {
      _timer.cancel();
    }
  }

  //Passing data to the break page
  void goToBreak() {
    Navigator.pushReplacementNamed(context, '/break', arguments: {
      'timeElapsedSeconds': stopwatch.elapsed.inSeconds,
      'breakDivider': breakDivider
    });
  }

  // Timer Functionality //

  String timerDisplay = "00:00:00";

  // Stopwatch object
  var stopwatch = Stopwatch();

  //Stopping the timer and sending to the break page

  //Starting the stopwatch
  Timer _timer;
  startStopwatch() {
    setState(() {
      _timer = Timer(Duration(seconds: 1), keepRunning);
    });
  }

  //Callback function for the stopwatch
  keepRunning() {
    if (stopwatch.isRunning) {
      startStopwatch();
    }
    setState(() {
      hourDisplay = stopwatch.elapsed.inHours.toString();
      minuteDisplay = (stopwatch.elapsed.inMinutes % 60).toString();
      secondDisplay = (stopwatch.elapsed.inSeconds % 60).toString();
    });
  }

  //Starting the stopwatch
  startTimer() {
    stopwatch.start();
    startStopwatch();
  }

  //Resetting the stopwatch
  resetTimer() {
    stopwatch.reset();
    hourDisplay = '0';
    minuteDisplay = '0';
    secondDisplay = '0';
    _timer.cancel();
  }

  //Pausing the stopwatch
  pauseTimer() {
    stopwatch.stop();
  }

  int breakDivider = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Row(
          children: [
            FlatButton.icon(
              icon: Icon(
                Icons.menu,
                color: Colors.amber[300],
                size: 40,
              ),
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/menu');
                setState(() {
                  breakDivider =
                      (result == null) ? 5 : (result['breakDivider']).round();
                  print(result);
                });
              },
              label: Text(''),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        items: [
          BottomNavigationBarItem(
            label: 'Work Mode',
            icon: Icon(
              Icons.work,
            ),
          ),
          BottomNavigationBarItem(
              label: 'Break Mode',
              icon: Icon(
                Icons.bedtime_sharp,
              ))
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[300],
        unselectedItemColor: Colors.grey[700],
        selectedLabelStyle: TextStyle(
          fontSize: 20,
          fontFamily: 'Cairo',
          letterSpacing: 4,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey[300],
          fontSize: 20,
          letterSpacing: 4,
          fontFamily: 'Cairo',
        ),
        onTap: _onTapped,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    hourDisplay,
                    style: TextStyle(
                        color: Colors.amber[300],
                        fontSize: 75,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'hrs',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 25,
                      letterSpacing: 2,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    minuteDisplay,
                    style: TextStyle(
                        color: Colors.amber[300],
                        fontSize: 75,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'mins',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 25,
                      letterSpacing: 2,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  Text(
                    secondDisplay,
                    style: TextStyle(
                        color: Colors.amber[300],
                        fontSize: 75,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'secs',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 25,
                      letterSpacing: 2,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        isTimerStarted ? 'Pause' : "Start",
                        style: TextStyle(
                          color: Colors.amber[300],
                          fontFamily: 'Cairo',
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isTimerStarted = isTimerStarted ? false : true;
                        isTimerStarted ? startTimer() : pauseTimer();
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                            color: Colors.amber[300],
                            width: 2,
                            style: BorderStyle.solid)),
                    color: backgroundColor,
                  ),
                  FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: isTimerStarted
                              ? Colors.grey[600]
                              : Colors.amber[300],
                          fontFamily: 'Cairo',
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    onPressed: isTimerStarted
                        ? null
                        : () {
                            setState(() {
                              resetTimer();
                            });
                          },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                            color: Colors.amber[300],
                            width: 2,
                            style: isTimerStarted
                                ? BorderStyle.none
                                : BorderStyle.solid)),
                    color: backgroundColor,
                  ),
                ],
              ),
              SizedBox(
                height: 150,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    stopTimer();
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'Take a Break',
                    style: TextStyle(
                        color: Colors.amber[300],
                        fontFamily: 'Cairo',
                        letterSpacing: 2,
                        fontSize: 20),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                        color: Colors.amber[300],
                        width: 2,
                        style: BorderStyle.solid)),
              ),
              SizedBox(
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}