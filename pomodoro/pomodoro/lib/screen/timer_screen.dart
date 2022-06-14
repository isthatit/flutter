import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _runningButtons = [
      ElevatedButton(
        child: Text(
          1 == 2 ? 'Continue' : 'Pause', // paused ? continue : pause
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: () {},
      ),
      Padding(padding: EdgeInsets.all(20)),
      ElevatedButton(
          child: Text(
            'Abandon',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.grey),
          onPressed: () {}),
    ];
    final List<Widget> _stoppedButtons = [
      ElevatedButton(
        child:
            Text('Start', style: TextStyle(color: Colors.white, fontSize: 16)),
        style: ElevatedButton.styleFrom(
            primary: 1 == 2 ? Colors.green : Colors.blue // break ? green : blue
            ),
        onPressed: () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Center(
              child: Text(
                '00:00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  1 == 2 ? Colors.green : Colors.blue, // Paused ? green : blue
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 1 == 2 // break ? !button : button
                ? const []
                : 1 == 2 // puased ? paused button : running button
                    ? _stoppedButtons
                    : _runningButtons,
          )
        ],
      ),
    );
  }
}
