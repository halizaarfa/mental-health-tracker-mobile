import 'package:flutter/material.dart';
import 'fortune_wheel/flutter_fortune_wheel.dart'; // Import from local directory
import 'dart:async'; // For StreamController

class SpinTheWheelPage extends StatefulWidget {
  @override
  _SpinTheWheelPageState createState() => _SpinTheWheelPageState();
}

class _SpinTheWheelPageState extends State<SpinTheWheelPage> {
  final StreamController<int> _controller = StreamController<int>();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _spinWheel() {
    // Randomly select an index for the FortuneWheel
    int randomIndex = DateTime.now().millisecondsSinceEpoch % 3;
    _controller.add(randomIndex); // Add the random index to the stream
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spin the Wheel'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the FortuneWheel widget
          FortuneBar(
            selected: _controller.stream,
            items: [
              FortuneItem(child: Text('Option 1')),
              FortuneItem(child: Text('Option 2')),
              FortuneItem(child: Text('Option 3')),
            ],
          ),
          SizedBox(height: 50),
          // Add a button to spin the wheel
          ElevatedButton(
            onPressed: _spinWheel,
            child: Text('Spin'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}
