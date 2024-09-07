import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/AdminPanel/admin_profile.dart';
import 'package:focus_fitnesss/Screens/AdminPanel/contact_us.dart';
import 'package:focus_fitnesss/Screens/AdminPanel/manage_diet_plan.dart';
import 'package:focus_fitnesss/Screens/AdminPanel/manage_schedules.dart';
import 'package:focus_fitnesss/Screens/AdminPanel/manage_users.dart';
import 'package:focus_fitnesss/Screens/generate_code.dart';
import 'package:focus_fitnesss/Screens/scan_code_page.dart';
import 'package:focus_fitnesss/widgets/AdminScreen/admin_header.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  int currentTab = 1;
  var adminName = "Loading..";
  var email = "Loading..";
  var contactNumber = "Loading..";

  Widget? currentScreen;
  bool _isGetAdminData = false;

  void getUserData() async {
    final userData = await FirebaseFirestore.instance
        .collection("admin")
        .doc("admin1")
        .get();
    if (!_isGetAdminData) {
      setState(() {
        adminName = userData["name"];
        email = userData["email"];
        contactNumber = userData["contact-number"];
      });
      _isGetAdminData = true;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    currentScreen = SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdminHeader(adminName: adminName),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManageUsers(
                                adminName: adminName,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 254, 94, 94),
                        ),
                        child: const Center(
                          child: Text(
                            "Manage Users",
                            style: TextStyle(
                              letterSpacing: 1.7,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManageSchedule(
                                adminName: adminName,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 254, 94, 94),
                        ),
                        child: const Center(
                          child: Text(
                            "Manage Schedules",
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
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManageDietPlan(
                                      adminName: adminName,
                                    )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 254, 94, 94),
                        ),
                        child: const Center(
                          child: Text(
                            "Manage Diet plans",
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
                  ],
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
                padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Active users :",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .snapshots(),
                          builder: (cxt, chatSnapshot) {
                            if (chatSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: Text(
                                  "Loading...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }

                            if (!chatSnapshot.hasData ||
                                chatSnapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text(
                                  "No users added",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }

                            if (chatSnapshot.hasError) {
                              return const Center(
                                child: Text(
                                  "Somthing went wrong",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }
                            final loadedData = chatSnapshot.data!.docs;
                            return Text(
                              "${loadedData.length}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "No of schedules :",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("schedules")
                              .snapshots(),
                          builder: (cxt, chatSnapshot) {
                            if (chatSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: Text(
                                  "Loading...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }

                            if (!chatSnapshot.hasData ||
                                chatSnapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text(
                                  "No schedules added",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }

                            if (chatSnapshot.hasError) {
                              return const Center(
                                child: Text(
                                  "Somthing went wrong",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }
                            final loadedData = chatSnapshot.data!.docs;
                            return Text(
                              "${loadedData.length}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "No of diet plans :",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("diet-plans")
                              .snapshots(),
                          builder: (cxt, chatSnapshot) {
                            if (chatSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: Text(
                                  "Loading...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }

                            if (!chatSnapshot.hasData ||
                                chatSnapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text(
                                  "No plans added",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }

                            if (chatSnapshot.hasError) {
                              return const Center(
                                child: Text(
                                  "Somthing went wrong",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }
                            final loadedData = chatSnapshot.data!.docs;
                            return Text(
                              "${loadedData.length}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 120,
                  width: 120,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (currentTab == 0) {
      currentScreen = const ContactUs();
    }
    if (currentTab == 2) {
      currentScreen = const AdminProfile();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          currentScreen!,
          if (currentTab == 1)
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 254, 94, 94),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ScanCode(),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        activeColor: const Color.fromARGB(255, 255, 94, 94),
        height: 55,
        elevation: 3,
        shadowColor: Colors.black87,
        color: Colors.white,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        items: const [
          TabItem(icon: Icons.list, title: 'Contact Dev'),
          TabItem(
              icon: Icons.admin_panel_settings_rounded,
              title: 'Manage Members'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }
}
