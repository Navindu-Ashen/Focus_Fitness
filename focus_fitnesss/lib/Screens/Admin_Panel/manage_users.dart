import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/user_detail.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  @override
  Widget build(BuildContext context) {
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
            height: 30,
          ),
          Column(
            children: [
              const Center(
                child: Text(
                  "Manage Users",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 16, left: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserDetailPage()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 42, 42, 42),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "User 3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
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
                  height: 150,
                  width: 150,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
