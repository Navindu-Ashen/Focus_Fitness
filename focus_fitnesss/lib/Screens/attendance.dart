import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focus_fitnesss/Screens/help_page.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key, required this.attendance});

  final List<dynamic> attendance;

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 25,
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
                        Positioned(
                          top: 50,
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
                        Positioned(
                          top: 100,
                          left: 10,
                          right: 10,
                          child: Text(
                            'Your Attendance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: const Color.fromARGB(255, 31, 31, 31),
                  height: screenHeight / 3,
                  child: ListView.builder(
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.attendance.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color.fromARGB(255, 60, 60, 60),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${(widget.attendance.length - index)}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  widget.attendance[
                                      (widget.attendance.length - index) - 1],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
