import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.12,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        width: screenSize.width * 0.25,
                        height: screenSize.height * 0.12,
                        color: const Color.fromARGB(255, 0, 98, 129),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/logo_2_blue 1.png"),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: screenSize.height * 0.05,
                            width: screenSize.width * 0.75,
                            color: const Color.fromARGB(255, 3, 142, 185),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "National Hospital Colombo",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.5,
                                      color: Colors.white,
                                    ),
                                  )
                                      .animate()
                                      .fade(duration: 500.ms)
                                      .scale(duration: 500.ms),
                                  Text(
                                    "hospitalcolombo.a@rescuemed.lk",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.5,
                                      color: Colors.white,
                                    ),
                                  )
                                      .animate()
                                      .fade(duration: 500.ms)
                                      .scale(duration: 500.ms),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
  }
}