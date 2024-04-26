import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Models/recipes.dart';


class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key, required this.rec});
   final Recipes rec;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "",
              height: 1000,
              width: 750,
              alignment: Alignment.topCenter,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 280),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 70,
                        width: 230,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 172, 172, 172),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Column(
                        children: [
                          Text(
                            "Diet Plan",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 255, 94, 94),
                            ),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "",
                            style: TextStyle(
                                fontSize: 17.8,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}
