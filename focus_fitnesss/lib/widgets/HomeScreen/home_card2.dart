import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeCard2 extends StatelessWidget {
  const HomeCard2({
    super.key,
    required this.onButtonPress,
    required this.buttonText,
    required this.description,
    required this.title,
    required this.imgPath,
    required this.textAlign,
  });

  final void Function() onButtonPress;
  final String title;
  final String description;
  final String buttonText;
  final String imgPath;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 400,
        width: screenWidth,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgPath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: screenWidth,
                child: Text(
                  title,
                  textAlign: textAlign,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit-Regular",
                    color: Color.fromARGB(255, 249, 249, 249),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: screenWidth,
                child: Column(
                  children: [
                    Text(
                      description,
                      textAlign: textAlign,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Outfit-Regular",
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 249, 249, 249),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                               const Color.fromARGB(255, 255, 94, 94),), 
                          ),
                          onPressed: onButtonPress,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              buttonText,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Outfit-Regular",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
