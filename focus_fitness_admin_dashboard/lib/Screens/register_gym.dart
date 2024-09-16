import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterGym extends StatefulWidget {
  const  RegisterGym({super.key});

  @override
  State< RegisterGym> createState() => _RegisterGymState();
}

class _RegisterGymState extends State< RegisterGym> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 1.25,
      height: screenSize.height * 1.1,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/1244688.jpg'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ENTER GYM",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 9,
                  ),
                ),
                Text(
                  "DETAILS",
                  style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 10,
                  ),
                ),
              ],
            ),
            Container(
              height: 2,
              width: screenSize.width,
              color: Colors.white,
            ),
            SizedBox(height: screenSize.height * 0.03),
            SizedBox(
              width: screenSize.width * 0.35,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  labelText: "Gym Name",
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            SizedBox(
              width: screenSize.width * 0.35,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  labelText: "Owner's Name",
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 94, 94)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            SizedBox(
              width: screenSize.width * 0.35,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  labelText: "Gym Location",
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 94, 94)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            SizedBox(
              width: screenSize.width * 0.35,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  labelText: "Contact Number",
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 94, 94)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            SizedBox(
              width: screenSize.width * 0.35,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 94, 94)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            SizedBox(
              width: screenSize.width * 0.35,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 94, 94)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            SizedBox(
              width: screenSize.width * 0.35,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 94, 94)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: AlignmentDirectional.bottomStart,
                  height: 130,
                  width: screenSize.width * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 52, 52, 52)
                            .withOpacity(0.4),
                        offset: const Offset(0, 5),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: SizedBox(
                      height: screenSize.height * 0.05,
                      width: screenSize.width * 0.08,
                      child: TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 94, 94),
                        ),
                        child: Center(
                          child: Text(
                            "+ Add Image",
                            style: GoogleFonts.poppins(
                              letterSpacing: 1.7,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.02),
                Column(
                  children: [
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
                          backgroundColor:
                              const Color.fromARGB(255, 255, 94, 94),
                        ),
                        child: Center(
                          child: Text(
                            "UPDATE",
                            style: GoogleFonts.poppins(
                              letterSpacing: 1.7,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
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
                          backgroundColor:
                              const Color.fromARGB(255, 255, 94, 94),
                        ),
                        child: Center(
                          child: Text(
                            "SUBMIT",
                            style: GoogleFonts.poppins(
                              letterSpacing: 1.7,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
