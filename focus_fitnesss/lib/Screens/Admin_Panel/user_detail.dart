// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  void _submit() {}
  String? _selectedSchedule;

  @override
  Widget build(BuildContext context) {
    List<String> scheduleNames = [
      'Morning workout',
      'Evening workout',
      'Cardio crush',
      'Weekend Pilates',
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            iconSize: 25,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              color: const Color.fromARGB(255, 164, 162, 162),
              width: double.infinity,
              height: 75,
              child: const Stack(
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
                      "Admin name",
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
              child: const Stack(
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
                      "Navindu Dissanayake",
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
              child: const Stack(
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
                      "test123@gmail.com",
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
              child: const Stack(
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
                      "0123456789",
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
              child: const Stack(
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
                      "Cardio crush",
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
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Container(
              height: 40,
              width: 380,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 60, 60, 60),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: DropdownButton<String>(
                  value: _selectedSchedule,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSchedule = newValue;
                    });
                  },
                  items: scheduleNames.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        color: Color.fromARGB(255, 60, 60, 60),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
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
                onPressed: _submit,
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
                    "Add / Change schedule",
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
            height: 8,
          ),
          Center(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 40,
              width: 350,
              child: ElevatedButton(
                onPressed: _submit,
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
    );
  }
}
