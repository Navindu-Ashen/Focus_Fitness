import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Level3Schedule extends StatefulWidget {
  const Level3Schedule({super.key});

  @override
  State<Level3Schedule> createState() => _Level3ScheduleState();
}

class _Level3ScheduleState extends State<Level3Schedule> {
  final _form = GlobalKey<FormState>();
  var scheduleName = "";
  var ex1Name = "";
  var ex2Name = "";
  var ex3Name = "";
  var ex4Name = "";
  var ex5Name = "";

  var ex1Sets = "";
  var ex2Sets = "";
  var ex3Sets = "";
  var ex4Sets = "";
  var ex5Sets = "";

  var ex1d2Name = "";
  var ex2d2Name = "";
  var ex3d2Name = "";
  var ex4d2Name = "";
  var ex5d2Name = "";

  var ex1d2Sets = "";
  var ex2d2Sets = "";
  var ex3d2Sets = "";
  var ex4d2Sets = "";
  var ex5d2Sets = "";

  var ex1d3Name = "";
  var ex2d3Name = "";
  var ex3d3Name = "";
  var ex4d3Name = "";
  var ex5d3Name = "";

  var ex1d3Sets = "";
  var ex2d3Sets = "";
  var ex3d3Sets = "";
  var ex4d3Sets = "";
  var ex5d3Sets = "";

  String formattedDate = "";
  var day1Name = "";
  var day2Name = "";
  var day1Cal = "";
  var day2Cal = "";
  var day3Name = "";
  var day3Cal = "";

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

    await FirebaseFirestore.instance
        .collection("schedules")
        .doc(scheduleName)
        .set({
      "available": ["day1", "day2"],
      "created-at": formattedDate,
      "ex_name_day1": [
        ex1Name,
        ex2Name,
        ex3Name,
        ex4Name,
        ex5Name,
      ],
      "ex_count_day1": [
        ex1Sets,
        ex2Sets,
        ex3Sets,
        ex4Sets,
        ex5Sets,
      ],
      "ex_name_day2": [
        ex1d2Name,
        ex2d2Name,
        ex3d2Name,
        ex4d2Name,
        ex5d2Name,
      ],
      "ex_count_day2": [
        ex1d2Sets,
        ex2d2Sets,
        ex3d2Sets,
        ex4d2Sets,
        ex5d2Sets,
      ],
      "ex_name_day3": [
        ex1d3Name,
        ex2d3Name,
        ex3d3Name,
        ex4d3Name,
        ex5d3Name,
      ],
      "ex_count_day3": [
        ex1d3Sets,
        ex2d3Sets,
        ex3d3Sets,
        ex4d3Sets,
        ex5d3Sets,
      ],
      "name": scheduleName,
      "day1-name": day1Name,
      "calories-day1": day1Cal,
      "day2-name": day2Name,
      "calories-day2": day2Cal,
      "day3-name": day3Name,
      "calories-day3": day3Cal,
    });

    setState(() {
      _isUpdting = false;
    });

    Navigator.of(context).pop();
  }

  void getDate() {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd  kk:mm').format(now);
    print(formattedDate);
  }

  @override
  void initState() {
    getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
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
                SizedBox(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.book),
                      labelText: "Day 1 name",
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
                      day1Name = value!;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter Day 1 name";
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                SizedBox(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelText: "Calories for day 1",
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
                      day1Cal = value!;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter calories for day 1";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.book),
                      labelText: "Day 2 name",
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
                      day2Name = value!;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter Day 2 name";
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          ex1d2Name = value!;
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
                          ex1d2Sets = value!;
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          ex2d2Name = value!;
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
                          ex2d2Sets = value!;
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          ex3d2Name = value!;
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
                          ex3d2Sets = value!;
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          ex4d2Name = value!;
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
                          ex4d2Sets = value!;
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
                          prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                          ex5d2Name = value!;
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
                          ex5d2Sets = value!;
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
                      labelText: "Calories for day 2",
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
                      day2Cal = value!;
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter calories for day 2";
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
                    fontSize: 18,
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
    );
  }
}
