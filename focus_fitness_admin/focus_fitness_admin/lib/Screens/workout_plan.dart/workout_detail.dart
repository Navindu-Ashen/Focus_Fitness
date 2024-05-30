import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Models/workout.dart';

class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({super.key, required this.wp});
  final WorkoutPlans wp;

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              widget.wp.img,
              width: double.infinity,
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 330),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 60,
                        width: 60,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 167, 167, 167),
                            offset: Offset(0, -5),
                            blurRadius: 12,
                            spreadRadius: 1)
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 238, 128, 128),
                          Color.fromARGB(255, 255, 94, 94),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              "Workout Plan",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.wp.title,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.wp.description,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "STEPS :",
                              style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.wp.steps,
                              style: const TextStyle(
                                  fontSize: 17.8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 40, right: 40),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/logo.png',
                                    height: 150,
                                    width: 150,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
