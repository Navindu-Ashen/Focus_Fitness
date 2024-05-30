import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/widgets/AdminScreen/adminHeader.dart';
import 'package:focus_fitnesss/widgets/AdminScreen/dataField.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

final firestoreInstance = FirebaseFirestore.instance;

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.contactNumber,
    required this.userUid,
    required this.schedule,
    required this.imageUrl,
    required this.instructor,
    required this.adminName,
    required this.currentDay,
    required this.createdAt,
  });
  final String userName;
  final String userEmail;
  final String contactNumber;
  final String userUid;
  final String schedule;
  final String imageUrl;
  final String instructor;
  final String adminName;
  final String currentDay;
  final String createdAt;

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final _form = GlobalKey<FormState>();
  final _form2 = GlobalKey<FormState>();

  String currentSchedule = "";
  String? selectedSchedule;
  List<String> currentSchedleList = [];
  String _selectedSchedule = "";
  String selectedInstructor = "";
  String currentInstructor = "";
  String formattedDate = "";
  String formattedDate2 = "";
  bool _isAttendanceMarking = false;
  bool attendaceMarcked = false;
  bool _isScheduleChanging = false;
  bool _isInstructorChanging = false;

  List<dynamic> attendance = [];
  bool _getAttendaceData = false;
  String lastAttendance = "";

  List<dynamic> availableSchedules = [];
  var currentDayIndex;

  Future<void> getDocumentNames() async {
    // Get a reference to the schedules collection
    final schedulesCollection = firestoreInstance.collection('schedules');

    // Use get() to retrieve all documents in the collection
    final querySnapshot = await schedulesCollection.get();

    // Iterate through the documents and print their IDs (which are their names in this case)
    for (var document in querySnapshot.docs) {
      currentSchedleList.add(document.id);
    }
    setState(() {});
  }

  void submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    _form.currentState!.save();
    FocusScope.of(context).unfocus();

    setState(() {
      _isScheduleChanging = true;
    });

    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userUid)
        .update({
      "schedule": selectedSchedule,
      "currentDay": "day1",
    });

    Navigator.of(context).pop();
  }

  void submit2() async {
    final isValid = _form2.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form2.currentState!.save();
    FocusScope.of(context).unfocus();

    setState(() {
      _isInstructorChanging = true;
    });

    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userUid)
        .update({
      "instructor": selectedInstructor,
    });

    Navigator.of(context).pop();
  }

  void deleteUser(String userUID) async {
    await FirebaseFirestore.instance.collection("users").doc(userUID).delete();
    await FirebaseStorage.instance
        .ref()
        .child("user-images")
        .child("${widget.userUid}.jpg")
        .delete();
    Navigator.of(context).pop();
  }

  void getScheduleData() async {
    final userData = await FirebaseFirestore.instance
        .collection("schedules")
        .doc(widget.schedule)
        .get();

    setState(() {
      availableSchedules = userData["available"];
    });
    for (int i = 0; i < availableSchedules.length; i++) {
      if (widget.currentDay == availableSchedules[i]) {
        currentDayIndex = i;
        print(currentDayIndex + 1);
        print(availableSchedules);
        print(availableSchedules.length);
      }
    }
  }

  void markAttendance() {
    final now = DateTime.now();
    formattedDate = formatter.format(now);

    if (widget.schedule == 0) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please set a schedule before mark attendance!",
          ),
        ),
      );
      return;
    }

    if (currentDayIndex + 1 == availableSchedules.length) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(widget.userUid)
          .update({
        "currentDay": availableSchedules[0],
      });
    } else {
      FirebaseFirestore.instance
          .collection("users")
          .doc(widget.userUid)
          .update({
        "currentDay": availableSchedules[currentDayIndex + 1],
      });
    }

    setState(() {
      _isAttendanceMarking = true;
    });
    FirebaseFirestore.instance.collection("users").doc(widget.userUid).update({
      "attendance": FieldValue.arrayUnion([formattedDate]),
    });
    setState(() {
      _isAttendanceMarking = false;
      attendaceMarcked = true;
    });
  }

  void getUserAttendance() async {
    final now2 = DateTime.now();
    formattedDate2 = formatter.format(now2);

    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userUid)
        .get();
    if (!_getAttendaceData) {
      setState(() {
        attendance = userData["attendance"];
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
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.schedule != "") {
      getUserAttendance();
      getScheduleData();
    }
    getDocumentNames();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.schedule == "") {
      currentSchedule = "Not available";
    } else {
      currentSchedule = widget.schedule;
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "Edit user data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdminHeader(adminName: widget.adminName),
              const SizedBox(
                height: 30,
              ),
              if (!_isAttendanceMarking &&
                  !attendaceMarcked &&
                  _getAttendaceData)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 550,
                      child: ElevatedButton(
                        onPressed: markAttendance,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 94, 94),
                        ),
                        child: const Center(
                          child: Text(
                            "Mark attendance",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (_isAttendanceMarking)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 550,
                      child: ElevatedButton(
                        onPressed: markAttendance,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 94, 94),
                        ),
                        child: Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              if (attendaceMarcked)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 550,
                      child: ElevatedButton(
                        onPressed: markAttendance,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 60, 60, 60),
                        ),
                        child: Center(
                          child: Text(
                            "Attendance marked!",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "User details :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              DataField(title: "User Name :", value: widget.userName),
              const SizedBox(height: 8),
              DataField(title: "User Email :", value: widget.userEmail),
              const SizedBox(height: 8),
              DataField(title: "Contact Numbet :", value: widget.contactNumber),
              const SizedBox(height: 8),
              DataField(
                  title: "Active Schedule :",
                  value: widget.schedule == ""
                      ? "No schedule assigned"
                      : widget.schedule),
              const SizedBox(
                height: 8,
              ),
              DataField(
                  title: "Instructor :",
                  value: widget.instructor == ""
                      ? "No instructor assigned"
                      : widget.instructor),
              const SizedBox(
                height: 8,
              ),
              DataField(title: "Created at :", value: widget.createdAt),
              const SizedBox(
                height: 8,
              ),
              DataField(
                  title: "Current Day :",
                  value: widget.currentDay == ""
                      ? "No schedule assigned"
                      : widget.currentDay),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Change schedule :",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Form(
                key: _form,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 750,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              value: selectedSchedule,
                              dropdownColor: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.circular(10),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedSchedule = newValue;
                                });
                              },
                              items: currentSchedleList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                            fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              hint: const Text(
                                "Select schedule",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              onSaved: (value) {
                                selectedSchedule = value;
                              },
                              validator: (value) {
                                if (selectedSchedule == null) {
                                  return "Select Schedule";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 40,
                  width: 550,
                  child: ElevatedButton(
                    onPressed: submit,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          if (!_isScheduleChanging)
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "+ Add or Change schedule",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          if (_isScheduleChanging)
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Change Instructor :",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Form(
                key: _form2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Container(
                        width: 750,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Enter insrtuctor name",
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 172, 172, 172),
                            ),
                            fillColor: const Color(0xFF2A2A2A),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                          ),
                          onSaved: (value) {
                            selectedInstructor = value!;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter instructor name";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 40,
                  width: 550,
                  child: ElevatedButton(
                    onPressed: submit2,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          if (!_isInstructorChanging)
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "+ Add or Change instructor",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          if (_isInstructorChanging)
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 40,
                  width: 550,
                  child: ElevatedButton(
                    onPressed: () {
                      deleteUser(widget.userUid);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          "- Remove member",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(35),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
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
