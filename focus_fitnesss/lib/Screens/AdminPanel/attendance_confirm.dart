import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class ConfirmAttendance extends StatefulWidget {
  const ConfirmAttendance({super.key, required this.qrData});

  final String qrData;

  @override
  State<ConfirmAttendance> createState() => _ConfirmAttendanceState();
}

class _ConfirmAttendanceState extends State<ConfirmAttendance> {
  var qrContent = "";
  String formattedDate = "";
  String formattedDate2 = "";
  String currentSchedule = "";
  String currentDay = "";
  String userUid = "";
  String userName = "";
  List<dynamic> availableSchedules = [];
  List<dynamic> attendance = [];
  String lastAttendance = "";
  var currentDayIndex;
  bool _isAttendanceMarking = false;
  bool attendaceMarcked = false;
  bool _getAttendaceData = false;

  void getScheduleData() async {
    print(
        "getting shecdule data...................................................................................................");
    final userData = await FirebaseFirestore.instance
        .collection("schedules")
        .doc(currentSchedule)
        .get();

    setState(() {
      availableSchedules = userData["available"];
    });
    for (int i = 0; i < availableSchedules.length; i++) {
      if (currentDay == availableSchedules[i]) {
        currentDayIndex = i;
        print("Currenr day index : ${currentDayIndex + 1}");
        print("Currenr day index : ${availableSchedules}");
      }
    }
    markAttendance();
  }

  void markAttendance() {
    print(
        "Marcking attendance...................................................................................................");
    final now = DateTime.now();
    formattedDate = formatter.format(now);

    // if (currentSchedule == 0) {
    //   ScaffoldMessenger.of(context).clearSnackBars();
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         "Please set a schedule before mark attendance!",
    //       ),
    //     ),
    //   );
    //   return;
    // }

    if (currentDayIndex + 1 == availableSchedules.length) {
      FirebaseFirestore.instance.collection("users").doc(userUid).update({
        "currentDay": availableSchedules[0],
      });
    } else {
      FirebaseFirestore.instance.collection("users").doc(userUid).update({
        "currentDay": availableSchedules[currentDayIndex + 1],
      });
    }

    FirebaseFirestore.instance.collection("users").doc(userUid).update({
      "attendance": FieldValue.arrayUnion([formattedDate]),
    });
    setState(() {
      _isAttendanceMarking = false;
    });
    print(
        "Marcking done...................................................................................................");
  }

  void getUserAttendance() async {
    final now2 = DateTime.now();
    formattedDate2 = formatter.format(now2);

    setState(() {
      _isAttendanceMarking = true;
    });

    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(qrContent)
        .get();
    if (!_getAttendaceData) {
      print(
          "Starting.............................................................................................");
      setState(() {
        attendance = userData["attendance"];
        currentSchedule = userData["schedule"];
        currentDay = userData["currentDay"];
        userUid = userData["user-uid"];
        userName = userData["name"];
      });
      _getAttendaceData = true;
      if (attendance.isNotEmpty) {
        lastAttendance = userData["attendance"][attendance.length - 1];
        if (lastAttendance == formattedDate2) {
          setState(() {
            attendaceMarcked = true;
          });
        }
      }
      print("Attendance : ${attendance}");
      print("Current schedule : ${currentSchedule}");
      print("Current Day : ${currentDay}");
      print("User UID : ${userUid}");
      print("Is attendace marcked : ${attendaceMarcked}");
      if (!attendaceMarcked) {
        getScheduleData();
      } else {
        setState(() {
          _isAttendanceMarking = false;
        });
      }

      return;
    }
  }

  @override
  void initState() {
    if (widget.qrData == Null) {
      return;
    }
    qrContent = widget.qrData;
    getUserAttendance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 20,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      body: !_isAttendanceMarking
          ? Center(
              child: !attendaceMarcked
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Your attendance is recorded",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Thankyou!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15),
                              child: Container(
                                height: 60,
                                width: 380,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 60, 60, 60),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Stack(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        "User Name :",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      right: 15,
                                      child: Text(
                                        userName,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15),
                              child: Container(
                                height: 60,
                                width: 380,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 60, 60, 60),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Stack(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        "Date :",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      right: 15,
                                      child: Text(
                                        formattedDate2,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    padding: const EdgeInsets.all(8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 254, 94, 94),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                        letterSpacing: 1.7,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/logo.png",
                          width: 100,
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your attendance already recorded",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Thankyou!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                padding: const EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 254, 94, 94),
                              ),
                              child: const Center(
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                    letterSpacing: 1.7,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Image.asset(
                            "assets/logo.png",
                            width: 100,
                          ),
                        ],
                      ),
                    ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 254, 94, 94),
              ),
            ),
    );
  }
}
