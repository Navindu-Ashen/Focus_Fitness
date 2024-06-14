import 'package:flutter/material.dart';

class Level3Schedule extends StatefulWidget {
  const Level3Schedule({super.key});

  @override
  State<Level3Schedule> createState() => _Level3ScheduleState();
}

class _Level3ScheduleState extends State<Level3Schedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: Text(
          "Level 3 Schedule",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}