import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/manage_diet_plan.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/manage_schedules.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/manage_users.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
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
            height: 40,
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
                            builder: (context) => const ManageUsers()),
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
                Container(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManageSchedule()),
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
                Container(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManageDietPlan()),
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
              height: 40,
              width: 380,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 60, 60, 60),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Active users :",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 210,
                      ),
                      Text(
                        "50",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 40,
              width: 380,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 60, 60, 60),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "No of schedules :",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 178,
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 40,
              width: 380,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 60, 60, 60),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "No of diet plans :",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 135),
            child: Image.asset(
              'assets/logo.png',
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        selectedItemColor: const Color.fromARGB(255, 255, 94, 94),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 25,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 25),
            label: '',
          ),
        ],
      ),
    );
  }
}
