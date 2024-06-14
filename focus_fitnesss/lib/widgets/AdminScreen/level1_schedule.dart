import 'package:flutter/material.dart';

class Level1Schedule extends StatefulWidget {
  const Level1Schedule({super.key});

  @override
  State<Level1Schedule> createState() => _Level1ScheduleState();
}

class _Level1ScheduleState extends State<Level1Schedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: Text(
          "Level 1 Schedule",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
