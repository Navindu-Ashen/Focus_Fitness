// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_ignore
// ignore: unused_import
import 'package:focus_fitnesss/Screens/Admin_Panel/admHome.dart';
import 'package:focus_fitnesss/Screens/login.dart';
import 'package:focus_fitnesss/main.dart';

final _firebase = FirebaseAuth.instance;

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final _form = GlobalKey<FormState>();
  var userEmail = "";
  var userPassword = "";
  var _isAuthenticating = false;
  var errorMessage = "";
  bool isObsecured = true;

  void _submit() async {
    final _isValid = _form.currentState!.validate();

    if (!_isValid) {
      return;
    }

    _form.currentState!.save();
    FocusScope.of(context).unfocus();

    setState(() {
      _isAuthenticating = true;
    });

    try {
      await _firebase.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? "Signup faild"),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    setState(() {
      _isAuthenticating = false;
    });

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return const MyApp();
    }), (r) {
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                'assets/2.jpg',
                width: double.infinity,
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 100, left: 90, right: 90),
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
                    height: 70,
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
                            const EdgeInsets.only(top: 5, left: 30, right: 30),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _form,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Welcome Back!",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "ADMIN LOGIN",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 255, 94, 94),
                                    letterSpacing: 5,
                                  ),
                                ),
                                const Text(
                                  "Login with your admin credentials",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // ignore: sized_box_for_whitespace
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                    labelText: "Admin Email",
                                    labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 172, 172, 172),
                                    ),
                                    fillColor: const Color(0xFF2A2A2A),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    filled: true,
                                  ),
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        !value.trim().contains("@")) {
                                      return "Enter valid email address";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                // ignore: sized_box_for_whitespace
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  obscureText: isObsecured,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: GestureDetector(
                                      onTap: () => setState(() {
                                        isObsecured = !isObsecured;
                                      }),
                                      child: Icon(
                                        isObsecured
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    labelText: "Admin Password",
                                    labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 172, 172, 172),
                                    ),
                                    fillColor: const Color(0xFF2A2A2A),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    filled: true,
                                  ),
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        value.trim().length < 5) {
                                      return "Password must be at least 5 characters";
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                if (!_isAuthenticating)
                                  SizedBox(
                                    height: 50,
                                    width: 300,
                                    child: ElevatedButton(
                                      onPressed: _submit,
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        padding: const EdgeInsets.all(14),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                            255, 255, 94, 94),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "LOGIN",
                                          style: TextStyle(
                                            letterSpacing: 1.7,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (_isAuthenticating)
                                  SizedBox(
                                    height: 50,
                                    width: 300,
                                    child: ElevatedButton(
                                      onPressed: _submit,
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        padding: const EdgeInsets.all(14),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                            255, 255, 94, 94),
                                      ),
                                      child: const Center(
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Forgot password ?",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "HELP SECTION",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 94, 94)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
