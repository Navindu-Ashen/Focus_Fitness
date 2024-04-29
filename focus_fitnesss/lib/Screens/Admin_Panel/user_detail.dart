// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  });
  final String userName;
  final String userEmail;
  final String contactNumber;
  final String userUid;
  final String schedule;
  final String imageUrl;
  final String instructor;
  final String adminName;

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

  @override
  void initState() {
    super.initState();
    getDocumentNames();
  }

  Future<void> getDocumentNames() async {
    // Get a reference to the schedules collection
    final schedulesCollection = firestoreInstance.collection('schedules');

    // Use get() to retrieve all documents in the collection
    final querySnapshot = await schedulesCollection.get();

    // Iterate through the documents and print their IDs (which are their names in this case)
    for (var document in querySnapshot.docs) {
      print(document.id);
      currentSchedleList.add(document.id);
    }
    setState(() {});
    print(currentSchedleList);
  }

  void submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    FocusScope.of(context).unfocus();

    print(selectedSchedule);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userUid)
        .set({
      "image-url": widget.imageUrl,
      "user-uid": widget.userUid,
      "name": widget.userName,
      "email": widget.userEmail,
      "contact-number": widget.contactNumber,
      "schedule": selectedSchedule,
      "instructor": widget.instructor,
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

    print(selectedInstructor);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userUid)
        .set({
      "image-url": widget.imageUrl,
      "user-uid": widget.userUid,
      "name": widget.userName,
      "email": widget.userEmail,
      "contact-number": widget.contactNumber,
      "schedule": currentSchedule,
      "instructor": selectedInstructor,
    });

    Navigator.of(context).pop();
  }

  void deleteUser(String userUID) async {
    await FirebaseFirestore.instance.collection("users").doc(userUID).delete();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.schedule == "") {
      currentSchedule = "Not available";
    } else {
      currentSchedule = widget.schedule;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  color: const Color.fromARGB(255, 164, 162, 162),
                  width: double.infinity,
                  height: 75,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 30, bottom: 5),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/p1.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 110),
                        child: Text(
                          "Welcome to ADMIN PANEL",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 49, 49),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 110),
                        child: Text(
                          widget.adminName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: const [
                  Center(
                    child: Text(
                      "Manage Users",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Current details :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Container(
                  height: 50,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "User Name :",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 15,
                        child: Text(
                          widget.userName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "User Email :",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 15,
                        child: Text(
                          widget.userEmail,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Contact number :",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 15,
                        child: Text(
                          widget.contactNumber,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Active schedule :",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 15,
                        child: Text(
                          widget.schedule == ""
                              ? "No active schedule"
                              : widget.schedule,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Instructor :",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 15,
                        child: Text(
                          widget.instructor == ""
                              ? "No instructor added"
                              : widget.instructor,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      Container(
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
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 255, 255, 255),
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
                  width: 350,
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
                    child: const Center(
                      child: Text(
                        "Add or Change schedule",
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
              const SizedBox(
                height: 16,
              ),
              Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 40,
                  width: 350,
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
                    child: const Center(
                      child: Text(
                        "Add or Change instructor",
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
              const SizedBox(
                height: 20,
              ),
              Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 40,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: const Center(
                      child: Text(
                        "Remove member",
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
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 150),
                child: Image.asset(
                  'assets/logo.png',
                  height: 130,
                  width: 130,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}