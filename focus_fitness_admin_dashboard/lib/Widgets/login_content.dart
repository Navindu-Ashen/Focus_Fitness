import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescue_med_admin/Screens/home_page.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         
          Container(
            width: screenSize.width / 2,
            height: screenSize.height,
            padding: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Emergency Ambulance and \nHospital Communication \nSystem ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 0, 98, 129),
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 200,
                  child: Image.asset(
                    'assets/medical_insurance_18 1.png',
                    width: 600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenSize.width / 3,
            height: screenSize.height * 0.85,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 3, 142, 185),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 184, 184, 184),
                  spreadRadius: 6,
                  blurRadius: 8,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
              ),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: screenSize.height * 0.08),
                    Column(
                      children: [
                        Text(
                          "Welcome Back!",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 8,
                          ),
                        )
                            .animate()
                            .fade(duration: 500.ms)
                            .slideY(delay: 700.ms, begin: -2),
                        Text(
                          "ADMIN LOGIN",
                          style: GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 3,
                          ),
                        )
                            .animate()
                            .fade(duration: 500.ms)
                            .slideY(delay: 700.ms, begin: -1),
                      ],
                    ),

                    Container(
                      height: 2,
                      width: screenSize.width * 0.25,
                      color: Colors.white,
                    ),

                    Text(
                      "Welcome to RescueMed Admin Panel.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(
                      width: screenSize.width * 0.25,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 103, 103, 103),
                            size: 20,
                          ),
                          labelText: "Enter Email Address",
                          labelStyle: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 103, 103, 103),
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                    // SizedBox(height: screenSize.height * 0.01),
                    SizedBox(
                      width: screenSize.width * 0.25,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 103, 103, 103),
                            size: 20,
                          ),
                          labelText: "Enter Password",
                          labelStyle: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 103, 103, 103),
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    SizedBox(
                      height: screenSize.height * 0.05,
                      width: screenSize.width * 0.1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: GoogleFonts.poppins(
                              letterSpacing: 1.7,
                              color: const Color.fromARGB(255, 3, 142, 185),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: screenSize.height * 0.05),
                    Center(
                      child: Image.asset(
                        'assets/logo_2_full_white 1.png',
                        width: 150,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "© 2024 RescueMed, All Rights Reserved  ",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {},
                                    child: Image.asset("assets/WhatsApp.png",width: 25,)),
                               
                                GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                        "assets/LinkedIn Circled.png",width: 25)),
                               
                                GestureDetector(
                                    onTap: () {},
                                    child: Image.asset("assets/GitHub.png",width: 25)),
                               
                              ],
                            ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
