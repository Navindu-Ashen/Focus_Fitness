import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/AI_bot.dart';
import 'package:focus_fitnesss/Screens/Profiles/profile.dart';
import 'package:focus_fitnesss/Screens/attendance.dart';
import 'package:focus_fitnesss/Screens/Recipes/recipe_all.dart';
import 'package:focus_fitnesss/Screens/Workouts/workout_all.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/bmi.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/home_card2.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/home_row2.dart';
import 'package:focus_fitnesss/widgets/header_bar.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/home_banner.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/home_row.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/todays_schedule.dart';

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
    print(widget.schedule);
    final userData = await FirebaseFirestore.instance
        .collection("schedules")
        .doc(widget.schedule)
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
              height: 15,
            ),
            HomeRow2(),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: 120,
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
    body: Stack(
      children: [
        currentContent!,
        if (currentTab == 1)
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 218, 234, 72),
              child: Icon(Icons.smart_toy,color: Colors.black,),
              onPressed: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => GymBot(),
                  ),
                );
              },
            ),
          ),
      ],
    ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        activeColor: const Color.fromARGB(255, 255, 94, 94),
        height: 55,
        elevation: 3,
        shadowColor: Colors.black87,
        color: Colors.white,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        items: const [
          TabItem(icon: Icons.list, title: 'Attendence'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
      ),
    );
  }
}
