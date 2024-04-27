import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Profiles/re-new.dart';
import 'package:focus_fitnesss/Screens/about_us.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
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
                      "Welcome Back!",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 49, 49),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 110),
                    child: Text(
                      "Navindu Dissanayake",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "User Profile",
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
              height: 60,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
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
              height: 60,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
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
              height: 60,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
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
              "Membership",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Container(
              height: 60,
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
                      "Valid until :",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 15,
                    child: Text(
                      "08/09/2024",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
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
              height: 60,
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
                      "Active workout plan :",
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
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
              height: 60,
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
                      "Your instructor :",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 15,
                    child: Text(
                      "Mr.Kevin Thalawathugoda",
                      style: TextStyle(
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
            height: 20,
          ),
          Center(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 40,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReNewMembership(),
                    ),
                  );
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
                  child: Text(
                    "Re-new membership",
                    style: TextStyle(
                      letterSpacing: 1.7,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
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
                  child: Text(
                    "About us",
                    style: TextStyle(
                      letterSpacing: 1.7,
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
            padding: const EdgeInsets.only(top: 25, left: 155),
            child: Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
