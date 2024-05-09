import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/widgets/image_picker.dart';
import 'package:intl/intl.dart';

final _firebase = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _form = GlobalKey<FormState>();
  var enteredName = "";
  var enteredEmail = "";
  var enteredContactNumber = "";
  var enteredPassword = "";
  var enteredConfirmPassword = "";
  File? _selectedImage;
  var _isAuthenticating = false;
  var errorMsg = "";
  bool isObsecured = true;
  bool isObsecured2 = true;

  void _submit() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd  kk:mm').format(now);
    print(formattedDate);

    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    print("Validation Done...............................");

    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Plaese set profile picture"),
        ),
      );
      return;
    }

    setState(() {
      _isAuthenticating = true;
    });

    _form.currentState!.save();
    FocusScope.of(context).unfocus();

    print("Validation Done...............................");

    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: enteredEmail, password: enteredPassword);

      final storageRef = FirebaseStorage.instance
          .ref()
          .child("user-images")
          .child("${userCredentials.user!.uid}.jpg");

      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set({
        "name": enteredName,
        "email": enteredEmail,
        "contact-number": enteredContactNumber,
        "image-url": imageUrl,
        "user-uid": FirebaseAuth.instance.currentUser!.uid,
        "schedule": "",
        "instructor": "",
        "attendance": [],
        "created-at": formattedDate,
        "currentDay" : "day1",
      });

      _form.currentState!.reset();
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        errorMsg = "Email adderss is already in use";
      } else if (error.code == "invalid-email") {
        errorMsg = "Email adderss is not valid";
      }

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
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
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/2.jpg',
              width: double.infinity,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 120),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 180,
                        width: 180,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                              const Text(
                                "Welcome!",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                "REGISTER",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 255, 94, 94),
                                    letterSpacing: 5),
                              ),
                              const Text(
                                "Welcome to Your Ultimate Training Companion",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              UserImagePicker(
                                onPickedImage: (pickedImage) {
                                  _selectedImage = pickedImage;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // ignore: sized_box_for_whitespace
                              TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Full name",
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontSize: 14,
                                  ),
                                  fillColor: const Color(0xFF2A2A2A),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                ),
                                onSaved: (value) {
                                  enteredName = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter your name";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8),
                              // ignore: sized_box_for_whitespace
                              TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Email address",
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontSize: 14,
                                  ),
                                  fillColor: const Color(0xFF2A2A2A),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                ),
                                onSaved: (value) {
                                  enteredEmail = value!;
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
                              const SizedBox(height: 8),
                              // ignore: sized_box_for_whitespace
                              TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Contact number",
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontSize: 14,
                                  ),
                                  fillColor: const Color(0xFF2A2A2A),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                ),
                                onSaved: (value) {
                                  enteredContactNumber = value!;
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      value.trim().length != 10) {
                                    return "Enter valid contact number";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8),
                              // ignore: sized_box_for_whitespace
                              TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                ),
                                obscureText: isObsecured,
                                decoration: InputDecoration(
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
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontSize: 14,
                                  ),
                                  fillColor: const Color(0xFF2A2A2A),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                ),
                                onSaved: (value) {
                                  enteredPassword = value!;
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      value.trim().length < 6) {
                                    return "Password shuold contains at least 6 characters";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8),
                              // ignore: sized_box_for_whitespace
                              TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                ),
                                obscureText: isObsecured2,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () => setState(() {
                                      isObsecured2 = !isObsecured2;
                                    }),
                                    child: Icon(
                                      isObsecured2
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  labelText: "Confirm password",
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                    fontSize: 14,
                                  ),
                                  fillColor: const Color(0xFF2A2A2A),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                ),
                                onSaved: (value) {
                                  enteredConfirmPassword = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Password isn's match";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      "Need Help?",
                                      style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ],
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
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 94, 94),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Register",
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
                                        borderRadius: BorderRadius.circular(50),
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
                                    )),
                                  ),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 94, 94)),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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
    );
  }
}
