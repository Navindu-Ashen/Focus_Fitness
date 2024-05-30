import 'package:flutter/material.dart';

class DietPlanDetail extends StatefulWidget {
  const DietPlanDetail({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.description,
  });

  final String imgUrl;
  final String name;
  final String description;

  @override
  State<DietPlanDetail> createState() => _DietPlanDetailState();
}

class _DietPlanDetailState extends State<DietPlanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(widget.imgUrl),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 330),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 60,
                      width: 60,
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 172, 172, 172),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 30, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Diet Plan",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 255, 94, 94),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.description,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 40, right: 40),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                  height: 150,
                                  width: 150,
                                )
                              ],
                            ),
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
