import 'package:flutter/material.dart';

class AdminHeader extends StatelessWidget {
  const AdminHeader({super.key, required this.adminName});

  final String adminName;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                "Welcome to User Control Panel",
                style: TextStyle(
                    color: Color.fromARGB(255, 51, 49, 49),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 110),
              child: Text(
                adminName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
