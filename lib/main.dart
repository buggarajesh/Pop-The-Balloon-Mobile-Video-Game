import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balloon Pop Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Balloon Pop Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _poppedBalloons = 0;
  int _missedBalloons = 0;
  Timer? _timer;
  List<Balloon> _balloons = [];

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    _poppedBalloons = 0;
    _missedBalloons = 0;
    _balloons.clear();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timer == null || _timer!.isActive) return;
      setState(() {
        if (duration.inSeconds > 0) {
          duration = duration - Duration(seconds: 1);
        } else {
          timer.cancel();
          endGame();
        }
      });
    });
    generateBalloons();
  }

  void generateBalloons() {
    // TODO: Implement balloon generation
  }

  void popBalloon(Balloon balloon) {
    setState(() {
      _poppedBalloons++;
      _balloons.remove(balloon);
    });
  }

  void missBalloon() {
    setState(() {
      _missedBalloons++;
    });
  }

  void endGame() {
    // TODO: Implement end game logic
  }

  Duration duration = Duration(minutes: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Time: ${duration.toString().substring(2, 7)}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Popped: $_poppedBalloons',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(width: 20),
              Text(
                'Missed: $_missedBalloons',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: _balloons,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startGame,
        tooltip: 'Start',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class Balloon extends State