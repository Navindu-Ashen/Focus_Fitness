import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Admin_Panel/add_diet_plan.dart';

class ManageDietPlan extends StatefulWidget {
  const ManageDietPlan({super.key, required this.adminName});

  final String adminName;

  @override
  State<ManageDietPlan> createState() => _ManageDietPlanState();
}

class _ManageDietPlanState extends State<ManageDietPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "Manage Diet Plans",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 750,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 550,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddDiet()),
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
                              "+Add diet plans",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 16, left: 16),
                    child: Column(
                      children: [
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("diet-plans")
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
                                  "No plans added",
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
                                    width: 750,
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
                                            onTap: () {},
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
                                                .collection("diet-plans")
                                                .doc(currentData["name"])
                                                .delete();
              
                                            await FirebaseStorage.instance
                                                .ref()
                                                .child("diet-plan-images")
                                                .child("${currentData["name"]}.jpg")
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
                    height: 40,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
