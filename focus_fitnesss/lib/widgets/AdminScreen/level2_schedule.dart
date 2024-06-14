import 'package:flutter/material.dart';

class Level2Schedule extends StatefulWidget {
  const Level2Schedule({super.key});

  @override
  State<Level2Schedule> createState() => _Level2ScheduleState();
}

class _Level2ScheduleState extends State<Level2Schedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: Text(
          "Level 2 Schedule",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}