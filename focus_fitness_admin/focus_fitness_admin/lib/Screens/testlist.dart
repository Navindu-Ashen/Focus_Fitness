import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/today_activity.dart';

class TestList extends StatefulWidget {
  const TestList({super.key, required this.instructor, required this.dayName, required this.currentDay,});

  final String instructor;
  final String dayName;
  final String currentDay;

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  final String schedule = "level2";
  List<dynamic> exName1 = [];
  List<dynamic> exCount1 = [];
  var calories = "500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 94, 94),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Text(
            widget.dayName,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 5, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today's activity",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodayActivity(
                          exersiceNames: exName1,
                          exersiceCounts: exCount1,
                          calories: calories,
                          instructor: widget.instructor,
                          workoutName: schedule,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "see all",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 94, 94),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('schedules')
                .doc(schedule)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    "No plans added",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Somthing went wrong. Pleace contact developers.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              }

              final data = snapshot.data!.data() as Map<String, dynamic>;
              exName1 = data['ex_name_${widget.currentDay}'] as List<dynamic>;
              exCount1 = data['ex_count_${widget.currentDay}'] as List<dynamic>;

              calories = data['calories'] as String;

              return SizedBox(
                height: 500,
                child: ListView.builder(
                  reverse: false,
                  itemCount: exName1.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      height: 30,
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color.fromARGB(255, 60, 60, 60),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              exName1[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              exCount1[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
