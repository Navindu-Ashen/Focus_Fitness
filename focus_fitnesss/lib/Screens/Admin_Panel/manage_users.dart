import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/user_detail.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({
    super.key,
    required this.adminName,
  });

  final String adminName;

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: const Color.fromARGB(255, 164, 162, 162),
                  width: double.infinity,
                  height: 75,
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 30, bottom: 5),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/p1.png"),
                        ),
                      ),
                      const Padding(
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
                        padding: const EdgeInsets.only(top: 30, left: 110),
                        child: Text(
                          widget.adminName,
                          style: const TextStyle(
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
                    padding:
                        const EdgeInsets.only(top: 25, right: 16, left: 16),
                    child: Column(
                      children: [
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .orderBy(
                                "created-at",
                                descending: false,
                              )
                              .snapshots(),
                          builder: (cxt, chatSnapshot) {
                            if (chatSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
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
                                  ),
                                ),
                              );
                            }

                            if (chatSnapshot.hasError) {
                              return const Center(
                                child: Text("Somthing went wrong"),
                              );
                            }

                            final loadedData = chatSnapshot.data!.docs;

                            return SizedBox(
                              height: 400,
                              child: ListView.builder(
                                reverse: false,
                                itemCount: loadedData.length,
                                itemBuilder: (context, index) {
                                  final currentData = loadedData[
                                          (loadedData.length - index) - 1]
                                      .data();

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) => UserDetailPage(
                                            userName: currentData["name"],
                                            userEmail: currentData["email"],
                                            contactNumber:
                                                currentData["contact-number"],
                                            imageUrl: currentData["image-url"],
                                            schedule: currentData["schedule"],
                                            userUid: currentData["user-uid"],
                                            instructor:
                                                currentData["instructor"],
                                            adminName: widget.adminName,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      height: 50,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 42, 42, 42),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${(loadedData.length - index)}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                if (currentData["schedule"] ==
                                                    "")
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 255, 94, 94),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 32),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 3),
                                                    child: Text(
                                                      "NEW",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              currentData["name"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
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
        ),
      ),
    );
  }
}
