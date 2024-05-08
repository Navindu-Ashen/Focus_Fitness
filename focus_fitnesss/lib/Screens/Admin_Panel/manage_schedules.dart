import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/add_schedule.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/schedules.dart';

class ManageSchedule extends StatefulWidget {
  const ManageSchedule({
    super.key,
    required this.adminName,
  });

  final String adminName;

  @override
  State<ManageSchedule> createState() => _ManageScheduleState();
}

class _ManageScheduleState extends State<ManageSchedule> {
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      width: double.infinity,
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
                          backgroundColor:
                              const Color.fromARGB(255, 255, 94, 94),
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
                padding: const EdgeInsets.only(top: 35, right: 16, left: 16),
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("schedules")
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
                              "No schedules added",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }

                        if (chatSnapshot.hasError) {
                          return const Center(
                            child: Text(
                              "Somthing went wrong. Pleace contact developers.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }

                        final loadedData = chatSnapshot.data!.docs;

                        return SizedBox(
                          height: 400,
                          child: ListView.builder(
                            reverse: false,
                            itemCount: loadedData.length,
                            itemBuilder: (context, index) {
                              final currentData = loadedData[index].data();

                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                height: 50,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 60, 60, 60),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (ctx) => Schedules(
                                                scheduleName:
                                                    currentData["name"],
                                                adminName: widget.adminName,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          currentData["name"],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection("schedules")
                                            .doc(currentData["name"])
                                            .delete();
                                      },
                                    ),
                                  ],
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
                height: 16,
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
        ),
      ),
    );
  }
}
