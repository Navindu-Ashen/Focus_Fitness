import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/widgets/AdminScreen/scheduleBlock.dart';

class Schedules extends StatefulWidget {
  const Schedules({
    super.key,
    required this.scheduleName,
    required this.adminName,
  });

  final String scheduleName;
  final String adminName;

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  List<dynamic> exName1 = [];
  List<dynamic> exCount1 = [];
  List<dynamic> exName2 = [];
  List<dynamic> exCount2 = [];
  List<dynamic> exName3 = [];
  List<dynamic> exCount3 = [];
  var day1;
  var day2;
  var day3;
  var caloriesDay1;
  var caloriesDay2;
  var caloriesDay3;
  var _isGetScheduleData = false;
  List<dynamic> dayCount = [];

  void getScheduleData() async {
    final userData = await FirebaseFirestore.instance
        .collection("schedules")
        .doc(widget.scheduleName)
        .get();

    dayCount = userData["available"];

    setState(() {
      _isGetScheduleData = true;
    });
  }

  void testPrint() {
    print(dayCount.length);
  }

  @override
  void initState() {
    super.initState();
    getScheduleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "Schedule Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.scheduleName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_isGetScheduleData)
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('schedules')
                      .doc(widget.scheduleName)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    testPrint();
                    final data = snapshot.data!.data() as Map<String, dynamic>;
                    exName1 = data['ex_name_${dayCount[0]}'] as List<dynamic>;
                    exCount1 = data['ex_count_${dayCount[0]}'] as List<dynamic>;
                    day1 = data['day1-name'];
                    caloriesDay1 = data['calories-day1'];
                    if (dayCount.length == 2) {
                      exName2 = data['ex_name_${dayCount[1]}'] as List<dynamic>;
                      exCount2 =
                          data['ex_count_${dayCount[1]}'] as List<dynamic>;
                      day1 = data['day1-name'];
                      day2 = data['day2-name'];
                      caloriesDay1 = data['calories-day1'];
                      caloriesDay2 = data['calories-day2'];

                      print(
                          "Done2......................$exName2,$caloriesDay1, $caloriesDay2, $exCount3, $exName3");
                    } else if (dayCount.length == 3) {
                      exName2 = data['ex_name_${dayCount[1]}'] as List<dynamic>;
                      exCount2 =
                          data['ex_count_${dayCount[1]}'] as List<dynamic>;
                      exName3 = data['ex_name_${dayCount[2]}'] as List<dynamic>;
                      exCount3 =
                          data['ex_count_${dayCount[2]}'] as List<dynamic>;
                      day1 = data['day1-name'];
                      day2 = data['day2-name'];
                      day3 = data['day3-name'];
                      caloriesDay1 = data['calories-day1'];
                      caloriesDay2 = data['calories-day2'];
                      caloriesDay3 = data['calories-day3'];
                      print("Done3......................");
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (exCount1 != [] && exName1 != [])
                          for (int i = 0; i < exCount1.length; i++)
                            ScheduleBlock(
                                exCount: exCount1[i], exName: exName1[i]),
                        const SizedBox(
                          height: 16,
                        ),
                        if (caloriesDay1 != null)
                          ScheduleBlock(
                              exCount: caloriesDay1, exName: "Calories"),
                        const SizedBox(
                          height: 32,
                        ),
                        if (exCount2 != [] && exName2 != [])
                          for (int i = 0; i < exCount2.length; i++)
                            ScheduleBlock(
                                exCount: exCount2[i], exName: exName2[i]),
                        const SizedBox(
                          height: 16,
                        ),
                        if (caloriesDay2 != null)
                          ScheduleBlock(
                              exCount: caloriesDay2, exName: "Calories"),
                        const SizedBox(
                          height: 32,
                        ),
                        if (exCount3 != [] && exName3 != [])
                          for (int i = 0; i < exCount3.length; i++)
                            ScheduleBlock(
                                exCount: exCount3[i], exName: exName3[i]),
                        const SizedBox(
                          height: 16,
                        ),
                        if (caloriesDay3 != null)
                          ScheduleBlock(
                              exCount: caloriesDay3, exName: "Calories")
                      ],
                    );
                  },
                ),
              if (!_isGetScheduleData)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: LinearProgressIndicator(
                      color: const Color.fromARGB(255, 255, 94, 94),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
