import 'dart:async';
import 'package:flutter/material.dart';
import "package:pomodoro/util.dart";
import "package:get/get.dart";

enum TimerStatus { ready, running, paused, stopped, resting }

class TimerScreenGetx extends StatelessWidget {
  static const WORK_SECONDS = 3;
  static const REST_SECONDS = 3;

  Rx<TimerStatus> _timerStatus = TimerStatus.stopped.obs;
  var _timer = 0.obs;
  late int _pomodoroCount;

  TimerScreenGetx() {
    _timerStatus(TimerStatus.stopped);
    _timer.value = WORK_SECONDS;
    _pomodoroCount = 0;
  }

  void run() {
    _timerStatus(TimerStatus.running);
    print("[=>] " + _timerStatus.toString());
    runTimer();
  }

  void rest() {
    _timer.value = REST_SECONDS;
    _timerStatus(TimerStatus.resting);
    print("[=>] " + _timerStatus.toString());
  }

  void pause() {
    _timerStatus(TimerStatus.paused);
    print("[=>] " + _timerStatus.toString());
  }

  void resume() {
    run();
  }

  void stop() {
    _timer.value = WORK_SECONDS;
    _timerStatus(TimerStatus.stopped);
    print("[=>] " + _timerStatus.toString());
  }

  void runTimer() async {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      print("_timerStatus.value: ${_timerStatus.value}");
      switch (_timerStatus.value) {
        case TimerStatus.paused:
          t.cancel();
          break;
        case TimerStatus.stopped:
          t.cancel();
          break;
        case TimerStatus.running:
          if (_timer.value <= 0) {
            showToast("complete!");
            rest();
          } else {
            _timer.value -= 1;
          }
          break;
        case TimerStatus.resting:
          if (_timer.value <= 0) {
            _pomodoroCount += 1;
            showToast("Today, $_pomodoroCount units pomodoro completed!");
            t.cancel();
            stop();
          } else {
            _timer.value -= 1;
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
      Obx(() => ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          onPressed: _timerStatus.value == TimerStatus.running ? pause : run,
          child: Text(
            _timerStatus.value == TimerStatus.paused
                ? 'resume'
                : 'Pause', // paused ? resume : pause
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ))),
      const Padding(padding: EdgeInsets.all(20)),
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.grey),
        onPressed: stop,
        // _timerStatus.value == TimerStatus.paused ? resume : pause,
        child: const Text(
          'Abandon',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ];
    final List<Widget> _stoppedButtons = [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: _timerStatus.value == TimerStatus.resting
                  ? Colors.green
                  : Colors.blue // break ? green : blue

              ),
          onPressed: run,
          child: const Text('Start',
              style: TextStyle(color: Colors.white, fontSize: 16))),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
        backgroundColor: _timerStatus.value == TimerStatus.resting
            ? Colors.green
            : Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(() => Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _timerStatus.value == TimerStatus.resting
                      ? Colors.green
                      : Colors.blue, // Paused ? green : blue
                ),
                child: Center(
                  child: Text(
                    secondsToString(_timer.value),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _timerStatus.value ==
                        TimerStatus.resting // break ? !button : button
                    ? const []
                    : _timerStatus.value ==
                            TimerStatus
                                .stopped // puased ? paused button : running button
                        ? _stoppedButtons
                        : _runningButtons,
              ))
        ],
      ),
    );
  }
}
