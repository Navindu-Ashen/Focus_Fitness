import 'package:flutter/material.dart';

class ProfileTextHolder extends StatelessWidget {
  const ProfileTextHolder({
    super.key,
    required this.feildName,
    required this.username,
  });

  final String username;
  final String feildName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 60,
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
                "$feildName :",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 15,
              child: Text(
                username,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
