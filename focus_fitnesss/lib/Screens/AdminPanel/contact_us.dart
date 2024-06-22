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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/devolopers.jpg',
            width: double.infinity,
            alignment: Alignment.topCenter,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight / 3,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Welcome!",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "CONTACT DEVELOPERS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 255, 94, 94),
                            ),
                          ),
                          const Text(
                            "Welcome to Your Premier Mobile Development Partner",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "At PeakTech Solutions, we're not just another mobile application development company, we're your partner in digital innovation and success. Since our inception in 2012, we've dedicated ourselves to empowering businesses of all sizes with cutting-edge mobile solutions, driving growth and excellence in the digital realm.",
                            style: TextStyle(
                                fontSize: 17.8,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Ready to kickstart your app journey? Reach out to us today or drop by for a consultation. We're excited to collaborate with you!",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/google.png',
                                height: 50,
                                width: 50,
                                alignment: Alignment.bottomCenter,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Image.asset(
                                'assets/facebook.png',
                                height: 50,
                                width: 50,
                                alignment: Alignment.bottomCenter,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Image.asset(
                                'assets/whatsapp.png',
                                height: 50,
                                width: 50,
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
                                    const Color.fromARGB(255, 255, 94, 94),
                                elevation: 10,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.phone_callback_sharp,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                    Text(
                                      "Contact us :",
                                      style: TextStyle(
                                        letterSpacing: 1.7,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
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
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
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
