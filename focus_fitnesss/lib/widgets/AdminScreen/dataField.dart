import 'package:flutter/material.dart';

class DataField extends StatelessWidget {
  const DataField({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 60, 60, 60),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 15,
              child: Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
