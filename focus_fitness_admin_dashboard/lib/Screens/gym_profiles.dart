import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescue_med_admin/Data/gym_profile.dart';
import 'package:rescue_med_admin/Models/hospital_profile.dart';
import 'package:rescue_med_admin/Screens/gym_profile_data.dart';

class GymProfiles extends StatefulWidget {
  const GymProfiles({super.key});

  @override
  State<GymProfiles> createState() => _GymProfilesState();
}

class _GymProfilesState extends State<GymProfiles> {
  int _currentTab = 0;

  void _onPressed() {
    setState(() {
      _currentTab = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentContent;
    var screenSize = MediaQuery.of(context).size;
    if (_currentTab == 0) {
      currentContent = Container(
        width: screenSize.width / 1.25,
        height: screenSize.height * 1.1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/1244688.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gym Profile List",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
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
              Expanded(
                child: ListView.builder(
                  itemCount: hospitaldata.length,
                  itemBuilder: (BuildContext context, int index) {
                    HospitalProfile dummydata = hospitaldata[index];
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: _onPressed,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            height: 65,
                            width: screenSize.width,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 94, 94),
                              borderRadius: BorderRadius.circular(10),
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dummydata.name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  // Container(
                                  //   alignment: Alignment.topCenter,
                                  //   child: Image.asset(
                                  //     'assets/icon_foreground.png',
                                  //     width: 100,
                                  //
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      currentContent = const GymProfileData(
        dummydata: GymProfiles(),
      );
    }

    return currentContent;
  }
}
