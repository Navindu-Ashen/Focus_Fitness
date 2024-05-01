import 'dart:io';

import 'package:flutter/material.dart';
import 'package:focus_fitnesss/widgets/image_picker2.dart';

class AddDiet extends StatefulWidget {
  const AddDiet({super.key});

  @override
  State<AddDiet> createState() => _AddDietState();
}

class _AddDietState extends State<AddDiet> {
  final _form = GlobalKey<FormState>();
  var planName = "";
  var planDescription = "";
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: const Color.fromARGB(255, 164, 162, 162),
                  width: double.infinity,
                  height: 75,
                  child: const Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 30, bottom: 5),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/p1.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 110),
                        child: Text(
                          "Welcome to ADMIN PANEL",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 49, 49),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 110),
                        child: Text(
                          "Admin name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                children: [
                  Center(
                    child: Text(
                      "Add plan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Form(
                    key: _form,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Plan name",
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
                              planName = value!;
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.trim().contains("@")) {
                                return "Enter plan name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          // ignore: sized_box_for_whitespace
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Plan descripiton",
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
                              planDescription = value!;
                            },
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Enter paln description";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ImagePicker2(
                            onPickedImage: (pickedImage) {
                              _selectedImage = pickedImage;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    // ignore: sized_box_for_whitespace
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 94, 94),
                              ),
                              child: const Center(
                                child: Text(
                                  "Add plan",
                                  style: TextStyle(
                                    letterSpacing: 1.7,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Image.asset(
                            'assets/logo.png',
                            height: 150,
                            width: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
