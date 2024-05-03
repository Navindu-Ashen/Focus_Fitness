import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final _form = GlobalKey<FormState>();
  var scheduleName = "";
  var calories = "";
  var ex1Name = "";
  var ex2Name = "";
  var ex3Name = "";
  var ex4Name = "";
  var ex5Name = "";
  var ex6Name = "";
  var ex7Name = "";
  var ex8Name = "";
  var ex9Name = "";
  var ex10Name = "";
  var ex1Sets = "";
  var ex2Sets = "";
  var ex3Sets = "";
  var ex4Sets = "";
  var ex5Sets = "";
  var ex6Sets = "";
  var ex7Sets = "";
  var ex8Sets = "";
  var ex9Sets = "";
  var ex10Sets = "";

  bool _isUpdting = false;

  void addSchedule() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    FocusScope.of(context).unfocus();

    setState(() {
      _isUpdting = true;
    });

    print(scheduleName);

    print([
      ex1Name,
      ex2Name,
      ex3Name,
      ex4Name,
      ex5Name,
      ex6Name,
      ex7Name,
      ex8Name,
      ex9Name,
      ex10Name
    ]);
    print([
      ex1Sets,
      ex2Sets,
      ex3Sets,
      ex4Sets,
      ex5Sets,
      ex6Sets,
      ex7Sets,
      ex8Sets,
      ex9Sets,
      ex10Sets
    ]);

    await FirebaseFirestore.instance
        .collection("schedules")
        .doc(scheduleName)
        .set({
      "ex_name_1": [
        ex1Name,
        ex2Name,
        ex3Name,
        ex4Name,
        ex5Name,
        ex6Name,
        ex7Name,
        ex8Name,
        ex9Name,
        ex10Name
      ],
      "ex_sets_1": [
        ex1Sets,
        ex2Sets,
        ex3Sets,
        ex4Sets,
        ex5Sets,
        ex6Sets,
        ex7Sets,
        ex8Sets,
        ex9Sets,
        ex10Sets
      ],
      "name": scheduleName,
      "calories": calories,
    });

    setState(() {
      _isUpdting = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                      "Add Schedules",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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
              Form(
                key: _form,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.book),
                            labelText: "Schedule Name",
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
                            scheduleName = value!;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter schedule name";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 1",
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
                                ex1Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter excersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex1Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 2",
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
                                ex2Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter exersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex2Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 3",
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
                                ex3Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter exersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex3Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 4",
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
                                ex4Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter exersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex4Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 5",
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
                                ex5Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter excersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex5Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 6",
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
                                ex6Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter excersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex6Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 7",
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
                                ex7Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter excersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex7Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 8",
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
                                ex8Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter excersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex8Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 9",
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
                                ex9Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter excersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex9Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth / 1.8,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fitness_center_rounded),
                                labelText: "Excersice Name 10",
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
                                ex10Name = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter excersice name";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_rounded),
                                labelText: "Sets",
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
                                ex10Sets = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter sets";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            labelText: "Calories",
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
                            calories = value!;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter calories";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              if (!_isUpdting)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: addSchedule,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: const Center(
                      child: Text(
                        "Add schedule",
                        style: TextStyle(
                          letterSpacing: 1.7,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              if (_isUpdting)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: addSchedule,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                    ),
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                  ),
                ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
