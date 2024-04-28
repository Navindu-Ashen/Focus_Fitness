import 'package:flutter/material.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              color: const Color.fromARGB(255, 164, 162, 162),
              width: double.infinity,
              height: 75,
              child: const Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6, left: 155),
                    child: Text(
                      "ADMIN PANEL",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 49, 49),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Admin profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/p1.png"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Admin details :",
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
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 150),
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
