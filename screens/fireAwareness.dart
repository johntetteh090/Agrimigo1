import 'package:flutter/material.dart';

class FireAwareness extends StatefulWidget {
  const FireAwareness({Key? key}) : super(key: key);

  @override
  _FireAwarenessState createState() => _FireAwarenessState();
}

class _FireAwarenessState extends State<FireAwareness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Fire Awareness Screen'),),
    );
  }
}
