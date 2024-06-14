import 'package:flutter/material.dart';
import 'package:focus_fitnesss/widgets/AdminScreen/level1_schedule.dart';
import 'package:focus_fitnesss/widgets/AdminScreen/level2_schedule.dart';
import 'package:focus_fitnesss/widgets/AdminScreen/level3_schedule.dart';

class AddManageSchedule extends StatefulWidget {
  const AddManageSchedule({super.key});

  @override
  State<AddManageSchedule> createState() => _AddManageScheduleState();
}

class _AddManageScheduleState extends State<AddManageSchedule> {
  List<bool> isSelected = [true, false, false];
  int currnetIndex = 0;
  @override
  Widget build(BuildContext context) {
    print("$currnetIndex");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "Select schedule type",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 197, 197, 197),
            ),
            child: ToggleButtons(
              isSelected: isSelected,
              selectedColor: Color.fromARGB(255, 255, 255, 255),
              color: Color.fromARGB(255, 0, 0, 0),
              fillColor: Color.fromARGB(255, 254, 94, 94),
              renderBorder: false,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              children: [
                Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Level 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Level 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Level 3',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
              onPressed: (int newIndex) {
                setState(() {
                  currnetIndex = newIndex;
                  for (int index = 0; index < isSelected.length; index++) {
                    if (index == newIndex) {
                      isSelected[index] = true;
                    } else {
                      isSelected[index] = false;
                    }
                  }
                });
              },
            ),
          ),
          if(currnetIndex == 0)
          Level1Schedule(),
          if(currnetIndex == 1)
          Level2Schedule(),
          if(currnetIndex == 2)
          Level3Schedule(),
          Center(
            child: Image.asset(
              'assets/logo.png',
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
