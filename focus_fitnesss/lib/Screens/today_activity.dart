import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/help_page.dart';

class TodayActivity extends StatefulWidget {
  const TodayActivity({
    super.key,
    required this.exersiceNames,
    required this.exersiceCounts,
    required this.calories,
    required this.instructor,
    required this.workoutName,
  });

  final List<dynamic> exersiceNames;
  final List<dynamic> exersiceCounts;
  final String calories;
  final String instructor;
  final String workoutName;

  @override
  State<TodayActivity> createState() => _TodayActivityState();
}

class _TodayActivityState extends State<TodayActivity> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
                child: SizedBox(
                  height: 180,
                  width: 400,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/g4.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 20,
                          left: 10,
                          right: 10,
                          child: Text(
                            'Action is the key to',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 45,
                          left: 10,
                          right: 10,
                          child: Text(
                            'ALL SUCCESS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 69, 70),
                                letterSpacing: 1.2),
                          ),
                        ),
                        const Positioned(
                          top: 90,
                          left: 10,
                          right: 10,
                          child: Text(
                            'Your Workout',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 60, 60, 60),
                                letterSpacing: 1.5),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 10,
                          right: 10,
                          child: Text(
                            widget.workoutName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                child: SizedBox(
                  width: 400,
                  child: Container(
                    height: 70,
                    width: 400,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 255, 119, 119),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.fitness_center,
                          color: Colors.white,
                          size: 50,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.calories,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w800),
                            ),
                            const Text(
                              "Calories",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        const Icon(
                          Icons.person_4_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Your instructor",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.instructor,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: screenHeight / 3.5,
                child: ListView.builder(
                  reverse: false,
                  itemCount: widget.exersiceNames.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 300,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Color.fromARGB(255, 60, 60, 60),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.exersiceNames[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    widget.exersiceCounts[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 52,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 119, 119)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Need Help?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HelpPage()),
                          );
                        },
                        child: const Text(
                          "HELP SECTION",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 255, 94, 94),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'assets/logo.png',
                        height: 130,
                        width: 130,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
