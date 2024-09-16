import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescue_med_admin/Screens/gym_profiles.dart';
import 'package:rescue_med_admin/Screens/register_gym.dart';
import 'package:rescue_med_admin/Widgets/dashboard_card.dart';
import 'package:rescue_med_admin/Widgets/side_nav_bar.dart';
import 'package:rescue_med_admin/Widgets/table.dart';
import 'package:rescue_med_admin/Widgets/table_data_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440 &&
      MediaQuery.of(context).size.height >= 650;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Row(
          children: [
            if (isDesktop(context))
              //SideNavBar...
              SideNavBar(onItemTapped: (val) {
                _onItemTapped(val);
              }),
            if (isDesktop(context))
              if (_selectedIndex == 0)
                Container(
                  width: screenSize.width / 1.25,
                  height: screenSize.height * 1.1,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/1244688.jpg'),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "DASHBOARD",
                                  style: GoogleFonts.poppins(
                                    fontSize: 45,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 3.5,
                                  ),
                                ),
                                Text(
                                  "FITNESS CENTER",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: 12,
                                  ),
                                ),
                              ],
                            ),
                            // Image.asset(
                            //   'assets/logo_2.png',
                            //   width: 150,
                            //   fit: BoxFit.cover,
                            // ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.03),
                        //Cards...
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardCard(
                                title: 'Gyms',
                                count: '120',
                                text: 'Total Registered Gym Count',
                                icon: Icons.fitness_center,
                              ),
                              DashboardCard(
                                title: 'Instructors',
                                count: '45',
                                text: 'Total Registered Instructors Count',
                                icon: Icons.co_present_rounded,
                              ),
                              DashboardCard(
                                title: 'Clients',
                                count: '680',
                                text: 'Total Rescued Clients Count',
                                icon: Icons.person,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "REGISTERED HISTORY",
                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.03),
                        //Tables...
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Table1(
                                topic: "Registered Gyms",
                                mainid: "Main Gym ID",
                                mainname: "Gym Name",
                                maincnum: "Owner's Name",
                                maintype: "Contact Num",
                                mainlocation: "Location",
                                cards: [
                                  TableDataCard(
                                    id: "G-256348",
                                    name: "Power Gym",
                                    cnum: "Mr.Kavya Attyagala",
                                    type: "045-5555666",
                                    location: "Colombo",
                                  ),
                                  TableDataCard(
                                    id: "G-256348",
                                    name: "Power Gym",
                                    cnum: "Mr.Kavya Attyagala",
                                    type: "045-5555666",
                                    location: "Colombo",
                                  ),
                                  TableDataCard(
                                    id: "G-256348",
                                    name: "Power Gym",
                                    cnum: "Mr.Kavya Attyagala",
                                    type: "045-5555666",
                                    location: "Colombo",
                                  ),
                                  TableDataCard(
                                    id: "G-256348",
                                    name: "Power Gym",
                                    cnum: "Mr.Kavya Attyagala",
                                    type: "045-5555666",
                                    location: "Colombo",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            if (isDesktop(context))
              if (_selectedIndex == 1) const RegisterGym(),
            if (isDesktop(context))
              if (_selectedIndex == 3) const GymProfiles(),
            if (!isDesktop(context))
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/7081557 1.png",
                        height: screenSize.height * 0.5,
                      ),
                      Text(
                        "Please open this application from a Larger Screen!",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.black),
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
