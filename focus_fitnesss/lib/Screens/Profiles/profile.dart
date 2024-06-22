import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Profiles/re-new.dart';
import 'package:focus_fitnesss/Screens/about_us.dart';
// ignore: unused_import
import 'package:focus_fitnesss/Screens/login.dart';
import 'package:focus_fitnesss/main.dart';
import 'package:focus_fitnesss/widgets/profile_text_holder.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
    required this.username,
    required this.contactNumber,
    required this.email,
    required this.instructor,
    required this.schedule,
    required this.validUnti,
    required this.imageUrl,
  });

  final String username;
  final String email;
  final String contactNumber;
  final String validUnti;
  final String schedule;
  final String instructor;
  final String imageUrl;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HeaderBar(
              //   imgUrl: widget.imageUrl,
              //   schedule: widget.schedule,
              //   username: widget.username,
              // ),
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.amber,
                  foregroundImage: NetworkImage(widget.imageUrl),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "User Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ProfileTextHolder(
                  feildName: "User Name", username: widget.username),
              const SizedBox(height: 8),
              ProfileTextHolder(
                  feildName: "User Email", username: widget.email),
              const SizedBox(height: 8),
              ProfileTextHolder(
                  feildName: "Contact number", username: widget.contactNumber),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Membership",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 8),
              ProfileTextHolder(
                  feildName: "Valid untill", username: "4/8/2024"),
              const SizedBox(height: 8),
              ProfileTextHolder(
                  feildName: "Active schedule", username: widget.schedule),
              const SizedBox(height: 8),
              ProfileTextHolder(
                feildName: "Your instructor",
                username: widget.instructor == ""
                    ? "No instructor"
                    : widget.instructor,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReNewMembership(
                            schedule: widget.schedule,
                            userName: widget.username,
                            userEmail: widget.email,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: const Center(
                      child: Text(
                        "Re-new membership",
                        style: TextStyle(
                          letterSpacing: 1.7,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutUs(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: const Center(
                      child: Text(
                        "About us",
                        style: TextStyle(
                          letterSpacing: 1.7,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const MyApp();
                      }), (r) {
                        return false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: const Center(
                      child: Text(
                        "Log out",
                        style: TextStyle(
                          letterSpacing: 1.7,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 155),
                child: Image.asset(
                  'assets/logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
