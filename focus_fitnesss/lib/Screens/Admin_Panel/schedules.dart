import 'package:flutter/material.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
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
                    "Schedules name 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                ),
              ],
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 50, top: 8, bottom: 8),
                          child: Text(
                            "exercise name 1",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 60, 60, 60),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 30, top: 8, bottom: 8),
                          child: Text(
                            "Sets",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 50, top: 8, bottom: 8),
                          child: Text(
                            "exercise name 1",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 60, 60, 60),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 30, top: 8, bottom: 8),
                          child: Text(
                            "Sets",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 50, top: 8, bottom: 8),
                          child: Text(
                            "exercise name 1",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 60, 60, 60),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 30, top: 8, bottom: 8),
                          child: Text(
                            "Sets",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 50, top: 8, bottom: 8),
                          child: Text(
                            "exercise name 1",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 60, 60, 60),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 30, top: 8, bottom: 8),
                          child: Text(
                            "Sets",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 240,
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 140,
                  width: 140,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
