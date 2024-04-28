import 'package:flutter/material.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
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
              height: 15,
            ),
            const Column(
              children: [
                Center(
                  child: Text(
                    "Add Schedules",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    height: 50,
                    width: 370,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Schedule name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Exercise name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'No of reps',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Exercise name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'No of reps',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Exercise name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'No of reps',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Exercise name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'No of reps',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Exercise name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 60, 60, 60),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'No of reps',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      // ignore: sized_box_for_whitespace
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 370,
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
                          const SizedBox(
                            height: 50,
                          ),
                          Image.asset(
                            'assets/logo.png',
                            height: 150,
                            width: 150,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
