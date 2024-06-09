import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/admin_profile.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/contact_us.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/manage_diet_plan.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/manage_schedules.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/manage_users.dart';
import 'package:focus_fitnesss/Screens/help_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/newgym1.jpg',
              width: double.infinity,
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Container(
                width: 250,
                height: double.infinity,
                color: Color.fromARGB(255, 46, 46, 46),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        'assets/logo.png',
                        height: 130,
                        width: 130,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdminMain()),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.home,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Dashboard",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AdminProfile()),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Profile",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ContactUs()),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Contact Us",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 385),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 30,
                        width: 220,
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
                            backgroundColor:
                                const Color.fromARGB(255, 255, 94, 94),
                          ),
                          child: const Center(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/d1.png',
                            color: Colors.white,
                            width: 30,
                            height: 30,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/d2.png',
                            color: Colors.white,
                            width: 30,
                            height: 30,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/d3.png',
                            color: Colors.white,
                            width: 30,
                            height: 30,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HelpPage()),
                          );
                        },
                        child: Text(
                          "Help",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                width: 250,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "DASHBOARD",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1),
                          ),
                          Text(
                            "FOCUSS FITNESS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 170,
                                width: 350,
                                decoration: const BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 94, 94),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.person_pin,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Members",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 35,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: 320,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 46, 46, 46),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Active Members",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "100",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 125,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 46, 46, 46),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Active users :",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection("users")
                                                    .snapshots(),
                                                builder: (cxt, chatSnapshot) {
                                                  if (chatSnapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return const Center(
                                                      child: Text(
                                                        "Loading...",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    );
                                                  }

                                                  if (!chatSnapshot.hasData ||
                                                      chatSnapshot
                                                          .data!.docs.isEmpty) {
                                                    return const Center(
                                                      child: Text(
                                                        "No users added",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    );
                                                  }

                                                  if (chatSnapshot.hasError) {
                                                    return const Center(
                                                      child: Text(
                                                        "Somthing went wrong",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    );
                                                  }
                                                  final loadedData =
                                                      chatSnapshot.data!.docs;
                                                  return Text(
                                                    "${loadedData.length}",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ManageUsers(
                                                          adminName: '',
                                                        )),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Manage Members",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Container(
                                height: 170,
                                width: 350,
                                decoration: const BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 94, 94),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.space_dashboard_outlined,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Schedules",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 35,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 320,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 46, 46, 46),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Active Schedules",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  StreamBuilder(
                                                    stream: FirebaseFirestore
                                                        .instance
                                                        .collection("schedules")
                                                        .snapshots(),
                                                    builder:
                                                        (cxt, chatSnapshot) {
                                                      if (chatSnapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const Center(
                                                          child: Text(
                                                            "Loading...",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        );
                                                      }

                                                      if (!chatSnapshot
                                                              .hasData ||
                                                          chatSnapshot.data!
                                                              .docs.isEmpty) {
                                                        return const Center(
                                                          child: Text(
                                                            "No schedules added",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        );
                                                      }

                                                      if (chatSnapshot
                                                          .hasError) {
                                                        return const Center(
                                                          child: Text(
                                                            "Somthing went wrong",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        );
                                                      }
                                                      final loadedData =
                                                          chatSnapshot
                                                              .data!.docs;
                                                      return Text(
                                                        "${loadedData.length}",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 37,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ManageSchedule(
                                                              adminName: '',
                                                            )),
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Manage Schedules",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 170,
                                width: 350,
                                decoration: const BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 94, 94),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.restaurant,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Diet-Plans",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 35,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 320,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 46, 46, 46),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Active Diet-Plans",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection("diet-plans")
                                                    .snapshots(),
                                                builder: (cxt, chatSnapshot) {
                                                  if (chatSnapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return const Center(
                                                      child: Text(
                                                        "Loading...",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    );
                                                  }

                                                  if (!chatSnapshot.hasData ||
                                                      chatSnapshot
                                                          .data!.docs.isEmpty) {
                                                    return const Center(
                                                      child: Text(
                                                        "No plans added",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    );
                                                  }

                                                  if (chatSnapshot.hasError) {
                                                    return const Center(
                                                      child: Text(
                                                        "Somthing went wrong",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    );
                                                  }
                                                  final loadedData =
                                                      chatSnapshot.data!.docs;
                                                  return Text(
                                                    "${loadedData.length}",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 37,
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ManageDietPlan(
                                                          adminName: '',
                                                        )),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Manage Plans",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Container(
                                height: 170,
                                width: 350,
                                decoration: const BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 94, 94),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.perm_contact_cal_sharp,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Instructors",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 35,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 320,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 46, 46, 46),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Active Instructors",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "5",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 37,
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Manage Instructors",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 110,
                                width: 350,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 94, 94),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/cash.png',
                                              height: 65,
                                              width: 65,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "Payments",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Manage Payments",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Container(
                                height: 110,
                                width: 350,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 94, 94),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.qr_code_2,
                                              color: Colors.white,
                                              size: 60,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Scan Member Details",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Scan Member QR",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 40,
                                width: 760,
                                child: ElevatedButton(
                                  onPressed: () {},
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
                                      "Get Current Summary",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 40,
                                width: 760,
                                child: ElevatedButton(
                                  onPressed: () {},
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
                                      "Contact Developers",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "© 2024 FOCUS FITNESS, All Rights Reserved.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    //  if (currentTab == 0) {
    //    currentScreen = const ContactUs();
    //  }
    //  if (currentTab == 2) {
    //    currentScreen = const AdminProfile();
    //  }
    return Scaffold(
      //   backgroundColor: Colors.black,
      body: currentScreen,
      //   bottomNavigationBar: BottomNavigationBar(
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //   currentIndex: currentTab,
      //     backgroundColor: const Color.fromARGB(255, 60, 60, 60),
      //     selectedItemColor: const Color.fromARGB(255, 255, 94, 94),
      //     unselectedItemColor: Colors.white,
      //     onTap: (value) {
      //       setState(() {
      //         currentTab = value;
      //       });
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.list, size: 30),
      //         label: '123',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.admin_panel_settings_rounded, size: 35),
      //         label: '123',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person, size: 30),
      //         label: '123',
      //       ),
      //     ],
      //   ),
    );
  }
}
