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
                padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/g4.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Action is the key to',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'ALL SUCCESS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 69, 70),
                                letterSpacing: 1.2),
                          ),
                          Text(
                            'Your Workout',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 60, 60, 60),
                                letterSpacing: 1.5),
                          ),
                          Text(
                            widget.workoutName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 1.5),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
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
                        Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 255, 119, 119),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 204, 95, 95),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: -12.0,
                                blurRadius: 12.0,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                            size: 50,
                          ),
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
                          width: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 204, 95, 95),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: -12.0,
                                blurRadius: 12.0,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.person_4_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
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
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.instructor.length > 10
                                  ? '${widget.instructor.substring(0, 10)}...'
                                  : widget.instructor,
                              style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                height: screenHeight / 3,
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
