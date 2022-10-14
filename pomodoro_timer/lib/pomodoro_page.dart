import 'dart:async';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const int SESSION_DURATION = 25; //minutes
// ignore: constant_identifier_names
const int NORMAL_BREAK_DURATION = 5; //minutes
// ignore: constant_identifier_names
const int SESSION_COUNT_TILL_LONG_BREAK = 4; //sessions counts
// ignore: constant_identifier_names
const int LONG_BREAK_DURATION = 15; //minutes

class PmodoroPage extends StatefulWidget {
  const PmodoroPage({super.key});

  @override
  State<PmodoroPage> createState() => _PmodoroPageState();
}

class _PmodoroPageState extends State<PmodoroPage> {
  int minutes = SESSION_DURATION;
  int seconds = 0;
  String status = "Focus"; // all options: ['Focus', 'Break', 'Long Break']

  bool running = false;
  int totalSessions = 0;
  int streakSessions = 0;

  Timer? _timer;

  void _start() {
    //if already running -> pause
    if (running) return _pause();

    //start running
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        running = true;
        //when duration is over
        if (seconds == 0 && minutes == 0) {
          if (status == "Focus") return _endSession();
          return _endBreak();
        }
        //time handling
        if (seconds > 0) {
          seconds--;
        } else {
          minutes--;
          seconds = 59;
        }
      });
    });
  }

  void _pause() {
    setState(() {
      _timer?.cancel();
      running = false;
    });
  }

  void _stop() {
    setState(() {
      _timer?.cancel();
      running = false;
      seconds = 0;
      //reset minutes
      if (status == "Focus") {
        minutes = SESSION_DURATION;
      } else if (status == "Long Break") {
        minutes = LONG_BREAK_DURATION;
      } else {
        minutes = NORMAL_BREAK_DURATION;
      }
    });
  }

  void _endSession() {
    //set the break
    setState(() {
      totalSessions++;
      streakSessions++;
      seconds = 0;
      //long break
      if (streakSessions == SESSION_COUNT_TILL_LONG_BREAK) {
        minutes = LONG_BREAK_DURATION;
        streakSessions = 0;
        status = "Long Break";
        //normal break
      } else {
        minutes = NORMAL_BREAK_DURATION;
        status = "Break";
      }
      _pause();
    });
  }

  void _endBreak() {
    //set focus time
    setState(() {
      minutes = SESSION_COUNT_TILL_LONG_BREAK;
      seconds = 0;
      status = "Focus";
      _pause();
    });
  }

  void _resetApp() {
    //reset all app vars
    setState(() {
      status = "Focus";
      _stop();
      totalSessions = 0;
      streakSessions = 0;
    });
  }

  String _getTotalFocusTime() {
    int totalMinutes = SESSION_DURATION * totalSessions;
    int hours = totalMinutes ~/ 60;
    int remMinutes = totalMinutes - (hours * 60);
    return "${hours.toString().length > 1 ? hours : '0$hours'}:${remMinutes.toString().length > 1 ? remMinutes : '0$remMinutes'}";
  }

  Color _specifyColor() {
    return status == "Focus" ? Colors.redAccent : Colors.blueAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _specifyColor(),
        title: const Text(
          "POMODORO TIMER",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _resetApp();
            },
            icon: const Icon(
              Icons.refresh_sharp,
              size: 35,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //status
            Center(
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: _specifyColor(),
                ),
              ),
            ),

            //timer cards
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //minutes
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: _specifyColor(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${minutes.toString().length > 1 ? minutes : '0$minutes'}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Text(
                  " : ",
                  style: TextStyle(fontSize: 75),
                ),

                //seconds
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: _specifyColor(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${seconds.toString().length > 1 ? seconds : '0$seconds'}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //stop button
                GestureDetector(
                  onTap: () {
                    _stop();
                  },
                  child: CircleAvatar(
                    backgroundColor: _specifyColor(),
                    radius: 30,
                    child: const Icon(
                      Icons.stop,
                      size: 40,
                    ),
                  ),
                ),

                //vertical spacing
                const SizedBox(width: 20),

                //start button
                GestureDetector(
                  onTap: () {
                    _start();
                  },
                  child: CircleAvatar(
                    backgroundColor: _specifyColor(),
                    radius: 30,
                    child: Icon(
                      running ? Icons.pause : Icons.play_arrow,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),

            //stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "$totalSessions",
                        style: const TextStyle(
                          fontSize: 45,
                        ),
                      ),
                      const Text(
                        "sessions",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),

                //focus time
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        _getTotalFocusTime(),
                        style: const TextStyle(
                          fontSize: 45,
                        ),
                      ),
                      const Text(
                        "focus time",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),

                //streak sessions
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "$streakSessions/$SESSION_COUNT_TILL_LONG_BREAK",
                        style: const TextStyle(
                          fontSize: 45,
                        ),
                      ),
                      const Text(
                        "streak",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
