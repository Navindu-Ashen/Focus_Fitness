import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Home Screen"),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(color: Colors.amber),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("schedules")
                    .snapshots(),
                builder: (cxt, chatSnapshot) {
                  if (chatSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!chatSnapshot.hasData ||
                      chatSnapshot.data!.docs.isEmpty) {
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
                                onTap: () {},
                                child: Text(
                                  "test",
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
            ),
            const SizedBox(
              height: 10,
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
