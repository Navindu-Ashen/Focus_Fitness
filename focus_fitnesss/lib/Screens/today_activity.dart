import 'package:flutter/material.dart';

class TodayActivity extends StatefulWidget {
  const TodayActivity({super.key});

  @override
  State<TodayActivity> createState() => _TodayActivityState();
}

class _TodayActivityState extends State<TodayActivity> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Today's",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
