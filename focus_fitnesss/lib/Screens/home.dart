import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Profiles/profile.dart';
import 'package:focus_fitnesss/Screens/attendance.dart';
import 'package:focus_fitnesss/Screens/recipes/recipe_all.dart';
import 'package:focus_fitnesss/Screens/today_activity.dart';
import 'package:focus_fitnesss/Screens/workout_plan.dart/workout_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.contactNumber,
    required this.email,
    required this.imgUrl,
    required this.instructor,
    required this.schedule,
    required this.username,
    required this.attendance,
    required this.calories,
  });

  final String username;
  final String schedule;
  final String imgUrl;
  final String instructor;
  final String email;
  final String contactNumber;
  final List<dynamic> attendance;
  final String calories;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 1;
  Widget? currentContent;

  List<dynamic> exName1 = [];
  List<dynamic> exCount1 = [];
  String calories = "";

  @override
  Widget build(BuildContext context) {
    currentContent = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 164, 162, 162),
              width: double.infinity,
              height: 75,
              child: Stack(
                children: [
                  if (widget.imgUrl != "Loading...")
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 30, bottom: 5),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(widget.imgUrl),
                      ),
                    ),
                  if (widget.imgUrl == "Loading...")
                    const Padding(
                      padding: EdgeInsets.only(top: 5, left: 30, bottom: 5),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/p1.png"),
                      ),
                    ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 110),
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 49, 49),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 110),
                    child: Text(
                      widget.username,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50, left: 112),
                    child: Text(
                      "Your current plan :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 49, 49),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 230),
                    child: Text(
                      widget.schedule,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 204, 74, 74),
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 360),
                    child: Icon(
                      Icons.notifications_active_outlined,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 30, right: 15, bottom: 20),
              child: Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 34, 34, 34),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/g2.png',
                        width: 400,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 10,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today is your",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            "Gym day",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 255, 94, 94),
                              fontSize: 38,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Text(
                            "You got 10 exercises in workout",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 5, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's activity",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodayActivity(
                            exersiceNames: exName1,
                            exersiceCounts: exCount1,
                            calories: calories,
                            instructor: widget.instructor,
                            workoutName: widget.schedule,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "see all",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 94, 94),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('schedules')
                      .doc(widget.schedule)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
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

                    if (snapshot.hasError) {
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

                    final data = snapshot.data!.data() as Map<String, dynamic>;
                    exName1 = data['ex_name_1'] as List<dynamic>;
                    exCount1 = data['ex_sets_1'] as List<dynamic>;

                    calories = data['calories'] as String;

                    return SizedBox(
                      height: 110,
                      child: ListView.builder(
                        reverse: false,
                        itemCount: 3,
                        itemBuilder: (ctx, index) {
                          return Container(
                            height: 30,
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
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fitness_center_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text(
                          calories,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Calories",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 270,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/g4.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 20,
                            left: 60,
                            child: Text(
                              'Action is the key to',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 40,
                            left: 50,
                            child: Text(
                              'ALL SUCCESS',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 94, 94),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "More workouts",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutPage()),
                      );
                    },
                    child: const Text(
                      "see all",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 94, 94),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Container(
                height: 140,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 94, 94),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/g5.png',
                        width: 130,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "Cardio Crush",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Mix fun dance moves with high energy cardio for an exhilarating.",
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(
                              'assets/logo.png',
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Diet Plans",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecipePage()),
                      );
                    },
                    child: const Text(
                      "see all",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 94, 94),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Container(
                height: 140,
                width: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/g6.png',
                        width: 130,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "Fitness Fusion",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Text(
                              "Improvements in strength, endurance, and overall well-being.",
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(
                              'assets/logo.png',
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
    if (currentTab == 2) {
      currentContent = UserProfile(
        username: widget.username,
        schedule: widget.schedule,
        email: widget.email,
        contactNumber: widget.contactNumber,
        instructor: widget.instructor,
        validUnti: "123456",
        imageUrl: widget.imgUrl,
      );
    } else if (currentTab == 0) {
      currentContent = AttendanceScreen(attendance: widget.attendance);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: currentContent,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentTab,
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        selectedItemColor: const Color.fromARGB(255, 255, 94, 94),
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 30),
            label: '123',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 35),
            label: '123',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: '123',
          ),
        ],
      ),
    );
  }
}
