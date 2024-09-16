import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescue_med_admin/Screens/gym_profiles.dart';


class GymProfileData extends StatefulWidget {
  const GymProfileData({
    super.key,
    required this.dummydata,
  });

  final GymProfiles dummydata;

  @override
  State<GymProfileData> createState() => _GymProfileDataState();
}

class _GymProfileDataState extends State<GymProfileData> {
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Power Lions Gym",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "23, Colombo 00200",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
              ],
            ),
            Container(
              height: 2,
              width: screenSize.width,
              color: Colors.white,
            ),
            SizedBox(height: screenSize.height * 0.03),
            Container(
              height: screenSize.height * 0.75,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 52, 52, 52).withOpacity(0.4),
                    offset: const Offset(0, 5),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gym Name :",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                            Text(
                              "Owner's Name :",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                            Text(
                              "Gym Location :",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),

                            Text(
                              "Email Address :",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                            Text(
                              "Contact Number :",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.03,
                            ),
                            // Text(
                            //   "Images :",
                            //   style: GoogleFonts.poppins(
                            //     color: const Color.fromARGB(255, 0, 98, 129),
                            //     fontWeight: FontWeight.w600,
                            //     fontSize: 17,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          width: screenSize.width * 0.06,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Power Lions Gym",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                            Text(
                              "Mr.Kavya Attyagala",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                            Text(
                              "23, Colombo 00200",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),

                            Text(
                              "powerlionsgymcmb@gmail.com",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                            Text(
                              "0115 777 777",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.03,
                            ),
                            // Container(
                            //   width: 30,
                            //   height: 30,
                            //   color: Colors.amber,
                            // )
                            // Image.asset(
                            //   'assets/navaloka-building 2.png',
                            // )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Images :",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * 0.11,
                            ),
                            Image.asset(
                              'assets/power1.jpg',
                              height: 210,
                              width: 210,
                            ),
                            SizedBox(
                              width: screenSize.width * 0.02,
                            ),
                            Image.asset(
                              'assets/power2.jpg',
                              height: 210,
                              width: 210,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
