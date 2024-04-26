import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/manageUsers.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  var userCount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Admin home Screen",
              style: TextStyle(fontSize: 20),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (cxt, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text("Loading..."),
                  );
                }

                if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No users added"),
                  );
                }

                if (chatSnapshot.hasError) {
                  return const Center(
                    child: Text("Somthing went wrong"),
                  );
                }
                final loadedData = chatSnapshot.data!.docs;
                return Text("User count: ${loadedData.length}");
              },
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("schedules")
                  .snapshots(),
              builder: (cxt, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text("Loading..."),
                  );
                }

                if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No schdules added"),
                  );
                }

                if (chatSnapshot.hasError) {
                  return const Center(
                    child: Text("Somthing went wrong"),
                  );
                }
                final loadedData = chatSnapshot.data!.docs;
                return Text("Schedule count: ${loadedData.length}");
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 17, 161, 26),
                  foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const ManageUsersScreen(),
                  ),
                );
              },
              child: const Text("Users"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 17, 161, 26),
                  foregroundColor: Colors.white),
              onPressed: () {},
              child: const Text("Schedules"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 32, 32),
                  foregroundColor: Colors.white),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
