import 'package:flutter/material.dart';

class ReNewMembership extends StatefulWidget {
  const ReNewMembership({super.key});

  @override
  State<ReNewMembership> createState() => _ReNewMembershipState();
}

class _ReNewMembershipState extends State<ReNewMembership> {
  void _submit() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              iconSize: 25,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                color: const Color.fromARGB(255, 164, 162, 162),
                width: double.infinity,
                height: 75,
                child: const Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 90),
                      child: Text(
                        "make your next step",
                        style: TextStyle(
                            color: Color.fromARGB(255, 51, 49, 49),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 90),
                      child: Text(
                        "Re-new Membership",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
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
                    "Membership details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Container(
                height: 60,
                width: 380,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        "User Name :",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 15,
                      child: Text(
                        "Navindu Dissanayake",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 60,
                width: 380,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        "Active workout plan :",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 15,
                      child: Text(
                        "Cardio crush",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 60,
                width: 380,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        "Payment amount ( per month ) :",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 15,
                      child: Text(
                        "LKR 8000",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Bank card details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 55,
                width: 380,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Card number',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                height: 55,
                width: 380,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Card holders name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                height: 55,
                width: 380,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Expire date (MM/YYYY)',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                height: 55,
                width: 380,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'CVV',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 40,
                width: 350,
                child: ElevatedButton(
                  onPressed: _submit,
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
                      "Pay now",
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
            Padding(
              padding: const EdgeInsets.only(top: 14, left: 155),
              child: Image.asset(
                'assets/logo.png',
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
