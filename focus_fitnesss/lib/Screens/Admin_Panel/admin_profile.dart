import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  var userName = "Loading...";
  var email = "Loading...";
  var contactNumber = "Loading...";
  bool _isGetUserData = false;

  void getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection("admin")
        .doc("admin1")
        .get();
    if (!_isGetUserData) {
      setState(() {
        userName = userData["name"];
        email = userData["email"];
        contactNumber = userData["contact-number"];
      });
      _isGetUserData = true;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color.fromARGB(255, 164, 162, 162),
                  width: double.infinity,
                  height: 75,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
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
                    child: Stack(
                      children: [
                        const Padding(
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
                    child: Stack(
                      children: [
                        const Padding(
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
                            email,
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
                    child: Stack(
                      children: [
                        const Padding(
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
                            contactNumber,
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
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromARGB(255, 254, 94, 94),
                      ),
                      child: const Center(
                        child: Text(
                          "Log out",
                          style: TextStyle(
                            letterSpacing: 1.7,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
      ),
    );
  }
}
