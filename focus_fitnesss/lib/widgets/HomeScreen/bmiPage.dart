import 'package:flutter/material.dart';

class Bmipage extends StatefulWidget {
  const Bmipage({super.key});

  @override
  State<Bmipage> createState() => _BmipageState();
}

class _BmipageState extends State<Bmipage> {
  int height = 100;
  int weight = 40;
  String gender = '';
  late double bmi = calculateBMI(height, weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Age : ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "22",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Height : ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "168 cm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Weight : ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "60 kg",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Male");
                        setState(() {
                          gender = 'M';
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(
                              color: gender == 'M'
                                  ? Color.fromARGB(255, 9, 113, 187)
                                  : const Color.fromARGB(255, 44, 44, 44),
                              borderRadius: BorderRadius.circular(25)),
                          padding: const EdgeInsets.all(15.0),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.male,
                                size: 75,
                                color: Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Female");
                        setState(() {
                          gender = 'F';
                        });
                      },
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                            color: gender == 'F'
                                ? const Color.fromARGB(255, 255, 94, 94)
                                : const Color.fromARGB(255, 44, 44, 44),
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(15.0),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 75,
                              color: Colors.white,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 44, 44, 44),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "New Height",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5),
                                      ),
                                      Text(
                                        "$height",
                                        style: TextStyle(
                                            color: (gender == 'F')
                                                ? const Color.fromARGB(
                                                    255, 255, 94, 94)
                                                : (gender == 'M')
                                                    ? Color.fromARGB(
                                                        255, 9, 113, 187)
                                                    : const Color.fromARGB(
                                                        255, 211, 209, 210),
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                FloatingActionButton(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 60, 60, 60),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (height > 80) height--;
                                                      bmi = calculateBMI(
                                                          height, weight);
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 40,
                                                    color: Color.fromARGB(
                                                        255, 199, 197, 197),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                FloatingActionButton(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 60, 60, 60),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (height < 220)
                                                        height++;
                                                      bmi = calculateBMI(
                                                          height, weight);
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 40,
                                                    color: Color.fromARGB(
                                                        255, 199, 197, 197),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //const Spacer(),
                    Column(
                      children: [
                        Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 44, 44, 44),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "New Weight",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5),
                                      ),
                                      Text(
                                        "$weight",
                                        style: TextStyle(
                                            color: (gender == 'F')
                                                ? const Color.fromARGB(
                                                    255, 255, 94, 94)
                                                : (gender == 'M')
                                                    ? Color.fromARGB(
                                                        255, 9, 113, 187)
                                                    : const Color.fromARGB(
                                                        255, 211, 209, 210),
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                FloatingActionButton(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 60, 60, 60),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (weight > 40) weight--;
                                                      bmi = calculateBMI(
                                                          height, weight);
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 40,
                                                    color: Color.fromARGB(
                                                        255, 199, 197, 197),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                FloatingActionButton(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 60, 60, 60),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (weight < 250)
                                                        weight++;
                                                      bmi = calculateBMI(
                                                          height, weight);
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 40,
                                                    color: Color.fromARGB(
                                                        255, 199, 197, 197),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                  ),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 17, 0),
                        fontSize: 70,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    getResult(bmi),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                  ),
                ],
              )
            ],
          )),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 25,
          color: Colors.white,
        ),
      ),
    );
  }

  double calculateBMI(int height, int weight) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
