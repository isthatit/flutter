import 'dart:async';
import 'package:flutter/material.dart';
import "package:pomodoro/util.dart";
import "package:get/get.dart";

enum TimerStatus { running, paused, stopped, resting }

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const WORK_SECONDS = 4;
  static const REST_SECONDS = 4;

  late TimerStatus _timerStatus;
  late int _timer;
  late int _pomodoroCount;

  @override
  void initState() {
    super.initState();
    _timerStatus = TimerStatus.stopped;
    print(_timerStatus.toString());
    _timer = WORK_SECONDS;
    _pomodoroCount = 0;
  }

  void run() {
    setState(() {
      _timerStatus = TimerStatus.running;
      print("[=>] " + _timerStatus.toString());
      runTimer();
    });
  }

  void rest() {
    setState(() {
      _timer = REST_SECONDS;
      _timerStatus = TimerStatus.resting;
      print("[=>] " + _timerStatus.toString());
    });
  }

  void pause() {
    setState(() {
      _timerStatus = TimerStatus.paused;
      print("[=>] " + _timerStatus.toString());
    });
  }

  void resume() {
    run();
  }

  void stop() {
    setState(() {
      _timer = WORK_SECONDS;
      _timerStatus = TimerStatus.stopped;
      print("[=>] " + _timerStatus.toString());
    });
  }

  void runTimer() async {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      switch (_timerStatus) {
        case TimerStatus.paused:
          t.cancel();
          break;
        case TimerStatus.stopped:
          t.cancel();
          break;
        case TimerStatus.running:
          if (_timer <= 0) {
            showToast("complete!");
            rest();
          } else {
            setState(() {
              _timer -= 1;
            });
          }
          break;
        case TimerStatus.resting:
          if (_timer <= 0) {
            setState(() {
              _pomodoroCount += 1;
            });
            showToast("Today, $_pomodoroCount units pomodoro completed!");
            t.cancel();
            stop();
          } else {
            setState(() {
              _timer -= 1;
            });
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _runningButtons = [
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: run,
        child: Text(
          _timerStatus == TimerStatus.paused
              ? 'resume'
              : 'Pause', // paused ? resume : pause
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      const Padding(padding: EdgeInsets.all(20)),
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.grey),
        onPressed: _timerStatus == TimerStatus.paused ? resume : pause,
        child: const Text(
          'Abandon',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ];
    final List<Widget> _stoppedButtons = [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: _timerStatus == TimerStatus.resting
                  ? Colors.green
                  : Colors.blue // break ? green : blue
              ),
          onPressed: run,
          child: const Text('Start',
              style: TextStyle(color: Colors.white, fontSize: 16))),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
        backgroundColor:
            _timerStatus == TimerStatus.resting ? Colors.green : Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _timerStatus == TimerStatus.resting
                  ? Colors.green
                  : Colors.blue, // Paused ? green : blue
            ),
            child: Center(
              child: Text(
                secondsToString(_timer),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _timerStatus ==
                    TimerStatus.resting // break ? !button : button
                ? const []
                : _timerStatus ==
                        TimerStatus
                            .stopped // puased ? paused button : running button
                    ? _stoppedButtons
                    : _runningButtons,
          )
        ],
      ),
    );
  }
}
