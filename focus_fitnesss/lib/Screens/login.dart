import 'package:flutter/material.dart';
import 'package:gym/Screens/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _submit() {
  }

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
                padding: const EdgeInsets.only(top: 100, left: 90, right: 90),
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
                        const EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Column(
                      children: [
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "LOGIN",
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
                          height: 20,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 55,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Your Email",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                              fillColor: const Color(0xFF2A2A2A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 55,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Your Password",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                              fillColor: const Color(0xFF2A2A2A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Forgot Password?",
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
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
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
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "CREATE AN ACCOUNT",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:  Color.fromARGB(255, 255, 94, 94)),
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
