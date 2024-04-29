import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Schedules extends StatefulWidget {
  const Schedules({
    super.key,
    required this.scheduleName,
    required this.adminName,
  });

  final String scheduleName;
  final String adminName;

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  List<dynamic> exName1 = [];
  List<dynamic> exCount1 = [];
  String calories = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Center(
                child: Text(
                  widget.scheduleName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('schedules')
                    .doc(widget.scheduleName)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
        
                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  exName1 = data['ex_name_1'] as List<dynamic>;
                  exCount1 = data['ex_sets_1'] as List<dynamic>;
                  calories = data['calories'] as String;
        
                  return Column(
                    children: [
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          reverse: false,
                          itemCount: exName1.length,
                          itemBuilder: (ctx, index) {
                            return Container(
                              height: 50,
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 5),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Color.fromARGB(255, 60, 60, 60),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      exName1[index],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      exCount1[index],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Color.fromARGB(255, 60, 60, 60),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Calories",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                calories,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
