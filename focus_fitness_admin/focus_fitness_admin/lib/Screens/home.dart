import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Profiles/profile.dart';
import 'package:focus_fitnesss/Screens/attendance.dart';
import 'package:focus_fitnesss/Screens/recipes/recipe_all.dart';
import 'package:focus_fitnesss/Screens/workout_plan.dart/workout_all.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/homeCard2.dart';
import 'package:focus_fitnesss/widgets/headerBar.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/homeBanner.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/homeRow.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/todaysSchedule.dart';

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
    required this.currentDay,
  });

  final String username;
  final String schedule;
  final String imgUrl;
  final String instructor;
  final String email;
  final String contactNumber;
  final List<dynamic> attendance;
  final String currentDay;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 1;
  Widget? currentContent;
  final String testSchedule = "level2";
  var dayName = "";
  bool _isSchduleData = false;

  List<dynamic> exName1 = [];
  List<dynamic> exCount1 = [];
  var calories = "";
  final String workoutCardTitle = "Cardio Crush";
  final String workoutCardDescription =
      "Mix fun dance moves with cardio for an exhilarating.";
  final String workoutCardImgPath = "assets/g5.png";
  final String dietPlanCardTitle = "Fitness Fusion";
  final String dietPlanCardDescription =
      "Improvements in strength, endurance, and overall well-being.";
  final String dietPlanCardImgPath = "assets/g6.png";

  void getScheduleData() async {
    final userData = await FirebaseFirestore.instance
        .collection("schedules")
        .doc(testSchedule)
        .get();
    if (!_isSchduleData) {
      setState(() {
        dayName = userData["${widget.currentDay}-name"];
        calories = userData["calories-${widget.currentDay}"];
      });
      _isSchduleData = true;
      return;
    }
  }

  @override
  void initState() {
    getScheduleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentContent = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentTab = 2;
                });
              },
              child: HeaderBar(
                  imgUrl: widget.imgUrl,
                  schedule: widget.schedule,
                  username: widget.username),
            ),
            HomePageBanner(
              gymDay: dayName,
            ),
            TodaysSdchedule(
              schedule: widget.schedule,
              instructor: widget.instructor,
              currentDay: widget.currentDay,
            ),
            const SizedBox(
              height: 8,
            ),
            HomeRow(calories: calories),
            const SizedBox(
              height: 15,
            ),
            HomeCard2(
              buttonText: "See all pre-workouts",
              description:
                  "No matter your fitness goals, there is an often overlooked component of success: stretching!",
              imgPath: "assets/5.jpg",
              title: "Best Pre and Post-Workout to Your Routine",
              textAlign: TextAlign.left,
              onButtonPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => WorkoutPage(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            HomeCard2(
              buttonText: "See all diet plans",
              description:
                  "A healthy eating plan gives your body the nutrients it needs every day while staying within your daily calorie goal for weight loss.",
              imgPath: "assets/dietPlanWall3.jpg",
              title: "Well managed diet plans for your fitness",
              textAlign: TextAlign.right,
              onButtonPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => RecipePage(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: Image.asset("assets/logo.png"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
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
        validUnti: "4/8/2024",
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