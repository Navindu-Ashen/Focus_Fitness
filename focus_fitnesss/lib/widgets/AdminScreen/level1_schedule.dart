import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Level1Schedule extends StatefulWidget {
  const Level1Schedule({super.key});

  @override
  State<Level1Schedule> createState() => _Level1ScheduleState();
}

class _Level1ScheduleState extends State<Level1Schedule> {
  final _form = GlobalKey<FormState>();
  List<dynamic> excersiceNames = [];
  List<dynamic> excersiceSets = [];
  var scheduleName = "";
  int exCount = 5;
  var _isUpdting = false;
  String formattedDate = "";

  ScrollController listScrollController = ScrollController();

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
      "available": ["day1"],
      "created-at": formattedDate,
      "ex_name_day1": excersiceNames,
      "ex_count_day1": excersiceSets,
      "name": scheduleName,
      "day1-name": scheduleName,
    });
    setState(() {
      _isUpdting = false;
    });
    Navigator.of(context).pop();
  }

  void addMoreElements() {
    setState(() {
      exCount++;
      if (listScrollController.hasClients) {
        final position = listScrollController.position.maxScrollExtent;
        listScrollController.jumpTo(position);
      }
    });
  }

  void removeElement() {
    if (exCount == 1) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("NOTE: There should be at least one exercise"),
        ),
      );
      return;
    } else {
      setState(() {
        exCount--;
      });
    }
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
    print("Element count: $exCount");
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Form(
          key: _form,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                width: screenWidth,
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 94, 94),
                    ),
                    prefixIcon: const Icon(Icons.fitness_center_rounded),
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
                      return "Enter excersice name";
                    }
                    return null;
                  },
                ),
              ),
              
              for (int i = 0; i < exCount; i++)
                Container(
                  padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth / 1.8,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 94, 94),
                            ),
                            prefixIcon:
                                const Icon(Icons.fitness_center_rounded),
                            labelText: "Excersice Name ${i + 1}",
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
                            excersiceNames.add(value);
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
                            errorStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 94, 94),
                            ),
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
                            excersiceSets.add(value);
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
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: addMoreElements,
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: ElevatedButton(
                  onPressed: removeElement,
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 94, 94),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        if (!_isUpdting)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: addSchedule,
              style: ElevatedButton.styleFrom(
                elevation: 2,
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
                elevation: 2,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color.fromARGB(255, 204, 75, 75),
              ),
              child: const Center(
                  child: SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))),
            ),
          ),
        const SizedBox(
          height: 32,
        )
      ],
    );
  }
}
