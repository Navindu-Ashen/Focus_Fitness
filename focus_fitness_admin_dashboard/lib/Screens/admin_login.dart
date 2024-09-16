import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescue_med_admin/Widgets/header.dart';
import 'package:rescue_med_admin/Widgets/login_content.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440 &&
      MediaQuery.of(context).size.height >= 500;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (!isDesktop(context)) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/7081557 1.png",
                height: screenSize.height * 0.5,
              ),
              Text(
                "Please open this application from a Larger Screen!",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isDesktop(context)) 
            const Header(),
            const LoginContent()
          ],
        ),
      ),
    );
  }
}
