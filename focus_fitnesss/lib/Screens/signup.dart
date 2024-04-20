import 'package:flutter/material.dart';
import 'package:gym/Screens/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  void _submit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/2.jpg',
            height: 1000,
            width: 750,
            alignment: Alignment.topCenter,
          ),
          Column(
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
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
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
                          ),
                        ),
                        const Text(
                          "Welcome to Your Ultimate Training Companion",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2A2A2A),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 230,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A2A2A),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: const Center(
                                child: Text(
                                  "Add profile picture",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 172, 172, 172),
                                      fontSize: 14.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Full name",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                              fillColor: const Color(0xFF2A2A2A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Email address",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                              fillColor: const Color(0xFF2A2A2A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Contact number",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                              fillColor: const Color(0xFF2A2A2A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                              fillColor: const Color(0xFF2A2A2A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Confirm password",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                              fillColor: const Color(0xFF2A2A2A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Need Help?",
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
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
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 94, 94),
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
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 94, 94)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
