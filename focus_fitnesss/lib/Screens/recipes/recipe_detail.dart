import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Models/recipes.dart';

class RecipeDetail2 extends StatefulWidget {
  const RecipeDetail2({
    super.key,
    required this.rec,
    required this.description,
    required this.imageUrl,
    required this.name,
  });
  final Recipes rec;
  final String imageUrl;
  final String description;
  final String name;

  @override
  State<RecipeDetail2> createState() => _RecipeDetail2State();
}

class _RecipeDetail2State extends State<RecipeDetail2> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            widget.imageUrl,
            height: 1000,
            width: 750,
            alignment: Alignment.topCenter,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  iconSize: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ),
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
              const SizedBox(
                height: 280,
              ),
              Expanded(
                child: Container(
                  height: screenHeight / 3,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 172, 172, 172),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
