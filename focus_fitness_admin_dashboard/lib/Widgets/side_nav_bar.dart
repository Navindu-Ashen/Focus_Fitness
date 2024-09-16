import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({
    super.key,
    required this.onItemTapped,
  });

  final void Function(int index) onItemTapped;

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 5,
      height: screenSize.height * 1.1,
      color: const Color.fromARGB(255, 46, 46, 46),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenSize.height * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.onItemTapped(0);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        backgroundColor: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.list,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.01,
                          ),
                          Text(
                            "Dashboard",
                            style: GoogleFonts.poppins(
                              fontSize: screenSize.height * 0.025,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.edit_document,
                            color: Colors.white70,
                            size: 30,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.01,
                          ),
                          Text(
                            "Register",
                            style: GoogleFonts.poppins(
                              fontSize: screenSize.height * 0.025,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextButton(
                        onPressed: () {
                          widget.onItemTapped(1);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: screenSize.width * 0.01,
                            ),
                            Text(
                              "Register Gym",
                              style: GoogleFonts.poppins(
                                fontSize: screenSize.height * 0.021,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
       
               ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white70,
                      size: 30,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Text(
                      "User Profiles",
                      style: GoogleFonts.poppins(
                        fontSize: screenSize.height * 0.025,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: TextButton(
                  onPressed: () {
                    widget.onItemTapped(3);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.fitness_center,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: screenSize.width * 0.01,
                      ),
                      Text(
                        "Gym Profiles",
                        style: GoogleFonts.poppins(
                          fontSize: screenSize.height * 0.021,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
              SizedBox(height: screenSize.height * 0.25),
              SizedBox(
                height: screenSize.height * 0.05,
                width: screenSize.width * 0.08,
                child: TextButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                  ),
                  child: Center(
                    child: Text(
                      "LOG OUT",
                      style: GoogleFonts.poppins(
                        letterSpacing: 1.7,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: screenSize.height * 0.025,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/WhatsApp.png",
                          width: screenSize.width * 0.02,
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/LinkedIn Circled.png",
                          width: screenSize.width * 0.02,
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/GitHub.png",
                          width: screenSize.width * 0.02,
                        )),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "© 2024 RescueMed, All Rights Reserved  ",
                    style: GoogleFonts.poppins(
                      fontSize: screenSize.height * 0.015,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
