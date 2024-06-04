import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/about_us.dart';
import 'package:focus_fitnesss/Screens/admLogin.dart';
// ignore: unused_import
import 'package:focus_fitnesss/Screens/signup.dart';

final _firebase = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  var userEmail = "";
  var userPassword = "";
  var _isAuthenticating = false;
  var errorMessage = "";
  bool isObsecured = true;

  void _submit() async {
    _form.currentState!.save();
    if (userEmail == "admin" && userPassword == "admin") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const AdminLoginScreen(),
        ),
      );
      return;
    }
    // else if (userEmail == "admin@gmail.com") {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (ctx) => const LoginPage(),
    //     ),
    //   );
    //   return;
    // }
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
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/newgym1.jpg',
              width: double.infinity,
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 450,
                      height: 500,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 172, 172, 172),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
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
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "ADMIN LOGIN",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 255, 94, 94),
                                    letterSpacing: 2,
                                  ),
                                ),
                                const Text(
                                  "Welcome to FOCUSS FITNESS Admin panel",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                // ignore: sized_box_for_whitespace
                                Container(
                                  width: 350,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.emailAddress,
                                    textCapitalization: TextCapitalization.none,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.email_outlined),
                                      labelText: "Admin Email",
                                      labelStyle: const TextStyle(
                                        fontSize: 13,
                                        color:
                                            Color.fromARGB(255, 172, 172, 172),
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
                                ),
                                const SizedBox(height: 10),
                                // ignore: sized_box_for_whitespace
                                Container(
                                  width: 350,
                                  child: TextFormField(
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
                                        fontSize: 13,
                                        color:
                                            Color.fromARGB(255, 172, 172, 172),
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
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                if (!_isAuthenticating)
                                  SizedBox(
                                    height: 50,
                                    width: 350,
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
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const AboutUs(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "CONTACT OWNER",
                                    style: TextStyle(
                                        fontSize: 13,
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
                    Column(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 300,
                          width: 300,
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "© 2024 FOCUS FITNESS, All Rights Reserved.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
