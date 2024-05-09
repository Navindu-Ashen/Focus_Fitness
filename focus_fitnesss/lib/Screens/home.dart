import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Profiles/profile.dart';
import 'package:focus_fitnesss/Screens/attendance.dart';
import 'package:focus_fitnesss/Screens/recipes/recipe_all.dart';
import 'package:focus_fitnesss/Screens/testlist.dart';
import 'package:focus_fitnesss/Screens/workout_plan.dart/workout_all.dart';
import 'package:focus_fitnesss/widgets/headerBar.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/homeBanner.dart';
import 'package:focus_fitnesss/widgets/HomeScreen/homeCard.dart';
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
  });

  final String username;
  final String schedule;
  final String imgUrl;
  final String instructor;
  final String email;
  final String contactNumber;
  final List<dynamic> attendance;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 1;
  Widget? currentContent;

  List<dynamic> exName1 = [];
  List<dynamic> exCount1 = [];
  var calories = "700";
  final String workoutCardTitle = "Cardio Crush";
  final String workoutCardDescription =
      "Mix fun dance moves with cardio for an exhilarating.";
  final String workoutCardImgPath = "assets/g5.png";
  final String dietPlanCardTitle = "Fitness Fusion";
  final String dietPlanCardDescription =
      "Improvements in strength, endurance, and overall well-being.";
  final String dietPlanCardImgPath = "assets/g6.png";

  @override
  Widget build(BuildContext context) {
    currentContent = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              gymDay: "Leg Day",
            ),
            TodaysSdchedule(
              schedule: widget.schedule,
              instructor: widget.instructor,
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => TestList(instructor: "Kev"),
                    ),
                  );
                },
                child: Text("Testing"),
              ),
            ),
            HomeRow(calories: calories),
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
            HomeCard(
              description: workoutCardDescription,
              imagePath: workoutCardImgPath,
              title: workoutCardTitle,
              color: Color.fromARGB(255, 255, 94, 94),
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
            HomeCard(
              description: dietPlanCardDescription,
              imagePath: dietPlanCardImgPath,
              title: dietPlanCardTitle,
              color: Color.fromARGB(255, 60, 60, 60),
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
