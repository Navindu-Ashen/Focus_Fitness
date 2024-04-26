import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/editUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageUsersScreen extends StatefulWidget {
  const ManageUsersScreen({super.key});

  @override
  State<ManageUsersScreen> createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (cxt, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
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

          return ListView.builder(
            reverse: false,
            itemCount: loadedData.length,
            itemBuilder: (context, index) {
              final currentData = loadedData[index].data();

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => EditUserScreen(
                                userName: currentData["name"],
                                userEmail: currentData["email"],
                                contactNumber: currentData["contact-number"],
                                userUid: currentData["user-uid"],
                                schedule: currentData["schedule"],
                                imageUrl: currentData["image-url"],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          currentData["name"],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
