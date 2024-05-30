import 'package:flutter/material.dart';

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({
    super.key,
    required this.gymDay,
  });

  final String gymDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 30, right: 15, bottom: 20),
      child: Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 34, 34),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/g2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                gymDay,
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
      ),
    );
  }
}
