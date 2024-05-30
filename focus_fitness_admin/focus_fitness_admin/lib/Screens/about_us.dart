import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  void _submit() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/2.jpg',
            height: 1000,
            width: 750,
            alignment: Alignment.topCenter,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 90, right: 90),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 230,
                      width: 230,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 172, 172, 172),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Welcome!",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "ABOUT US",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 255, 94, 94),
                            ),
                          ),
                          const Text(
                            "Welcome to Your Ultimate Training Companion",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "At Focus Fitness, we're more than just a place to work out, we're a hub for wellness, motivation, and progress. Since our establishment 2010, we've been committed to helping individuals of all fitness levels achieve their goals and lead healthier, more fulfilling lives.",
                            style: TextStyle(
                                fontSize: 17.8,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Ready to embark on your fitness journey? Contact us today or stop by for a tour. We can't wait to meet you!",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: 500,
                            child: TextButton(
                              onPressed: _submit,
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 94, 94),
                                elevation: 10,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.phone_callback_sharp,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                    Text(
                                      "Contact us :",
                                      style: TextStyle(
                                        letterSpacing: 1.7,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "+940771234567",
                                      style: TextStyle(
                                        letterSpacing: 1.7,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
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
    );
  }
}
