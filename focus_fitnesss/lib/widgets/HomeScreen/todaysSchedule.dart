import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/today_activity.dart';

class TodaysSdchedule extends StatefulWidget {
  const TodaysSdchedule(
      {super.key, required this.schedule, required this.instructor});

  final String schedule;
  final String instructor;

  @override
  State<TodaysSdchedule> createState() => _TodaysSdcheduleState();
}

class _TodaysSdcheduleState extends State<TodaysSdchedule> {
  List<dynamic> exName1 = [];
  List<dynamic> exCount1 = [];
  var calories = "500";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        workoutName: widget.schedule,
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
              .doc(widget.schedule)
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
            exName1 = data['ex_name_1'] as List<dynamic>;
            exCount1 = data['ex_sets_1'] as List<dynamic>;

            calories = data['calories'] as String;

            return SizedBox(
              height: 110,
              child: ListView.builder(
                reverse: false,
                itemCount: 3,
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
    );
  }
}
