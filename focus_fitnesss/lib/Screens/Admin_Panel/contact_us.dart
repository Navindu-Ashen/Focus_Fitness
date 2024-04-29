import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  void _submit() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/dev.png',
            height: 1000,
            width: 750,
            alignment: Alignment.topCenter,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 210,
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
                          "CONTACT US",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 148, 94, 255),
                          ),
                        ),
                        const Text(
                          "Welcome to Your Premier Mobile Development Partner",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "At PeakTech Solutions, we're not just another mobile application development company, we're your partner in digital innovation and success. Since our inception in 2012, we've dedicated ourselves to empowering businesses of all sizes with cutting-edge mobile solutions, driving growth and excellence in the digital realm.",
                          style: TextStyle(
                              fontSize: 17.8,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Ready to kickstart your app journey? Reach out to us today or drop by for a consultation. We're excited to collaborate with you!",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/google.webp',
                              height: 75,
                              width: 75,
                              alignment: Alignment.bottomCenter,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Image.asset(
                              'assets/fb.png',
                              height: 50,
                              width: 50,
                              alignment: Alignment.bottomCenter,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Image.asset(
                              'assets/wp.webp',
                              height: 70,
                              width: 70,
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 500,
                          child: TextButton(
                            onPressed: _submit,
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 148, 94, 255),
                              elevation: 10,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone_callback_sharp,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Contact us :",
                                    style: TextStyle(
                                      letterSpacing: 1.7,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 35),
                                  Text(
                                    "+940771234567",
                                    style: TextStyle(
                                      letterSpacing: 1.7,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
