import 'package:flutter/material.dart';

class Bmipage extends StatefulWidget {
  const Bmipage({super.key});

  @override
  State<Bmipage> createState() => _BmipageState();
}

class _BmipageState extends State<Bmipage> {
  int height = 150;
  int weight = 55;
  String gender = '';
  late double bmi = calculateBMI(height, weight);
  Color resultColor = Colors.white;

  void colorChange(){
    if(bmi < 18.5){
      resultColor = Colors.blue;
    }else if(18.5 <= bmi && bmi <= 24.9){
      resultColor = Colors.green;
    }else if(25 <= bmi && bmi <= 29.9){
      resultColor = Colors.yellow;
    }else if(30 <= bmi && bmi <= 34.9){
      resultColor = Colors.orange;
    }else if(bmi > 35){
      resultColor = Colors.red;
    }else{
      resultColor = Colors.white;
    }
  } 

  @override
  void initState() {
    colorChange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: SingleChildScrollView(
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
                                "22 yrs",
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
                                "$height cm",
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
                                "$weight KG",
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
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            width: screenWidth/2.5,
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
                          width: screenWidth/2.5,
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
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: screenWidth/2.5,
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
                                                            colorChange();
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
                                                            colorChange();
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
                            width: screenWidth/2.5,
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
                                                            colorChange();
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
                                                            colorChange();
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
                const SizedBox(height: 24,),
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
                  style: TextStyle(
                      color: resultColor,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 254, 94, 94),
                        ),
                        child: const Center(
                          child: Text(
                            "Save current BMI",
                            style: TextStyle(
                              letterSpacing: 1.7,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                )
              ],
            ),
          )),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 20,
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
