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
  void deleteSchedule(BuildContext context, String schduleName) {
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 94, 94),
          foregroundColor: Color.fromARGB(255, 255, 255, 255)),
      child: Text("Delete"),
      onPressed: () async {
        await FirebaseFirestore.instance
            .collection("schedules")
            .doc(schduleName)
            .delete();
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      title: Text(
        "Are you sure!",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 120,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Would you like to delete selected schedule?",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Schdule name : $schduleName",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "Manage Schedules",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
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
                Padding(
                  padding: const EdgeInsets.only(top: 35, right: 16, left: 16),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("schedules")
                        .orderBy(
                          "created-at",
                          descending: true,
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

                      return Container(
                        height: screenHeight / 2,
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
                                              scheduleName: currentData["name"],
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
                                    onPressed: () {
                                      deleteSchedule(
                                        context,
                                        currentData["name"],
                                      );
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
                ),
              ],
            ),
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
