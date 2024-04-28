import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/add_schedule.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/schedules.dart';

class ManageSchedule extends StatefulWidget {
  const ManageSchedule({super.key});

  @override
  State<ManageSchedule> createState() => _ManageScheduleState();
}

class _ManageScheduleState extends State<ManageSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.only(top: 20),
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
              height: 15,
            ),
            const Column(
              children: [
                Center(
                  child: Text(
                    "Manage Schedules",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              // ignore: sized_box_for_whitespace
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddSchedule()),
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
                          "Add schedule",
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 15, left: 20),
              child: GestureDetector(
                onTap: () {  
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Schedules()),
                );
                  },
                child: Container(
                  height: 40,
                  width: 370,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Schedule name 1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 15, left: 20),
              child: GestureDetector(
                 onTap: () {  
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Schedules()),
                );
                  },
                child: Container(
                  height: 40,
                  width: 370,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Schedule name 2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 15, left: 20),
              child: GestureDetector(
                 onTap: () {  
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Schedules()),
                );
                  },
                child: Container(
                  height: 40,
                  width: 370,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Schedule name 3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 135),
              child: Image.asset(
                'assets/logo.png',
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
