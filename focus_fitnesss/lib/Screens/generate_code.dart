import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateCode extends StatefulWidget {
  const GenerateCode({super.key});

  @override
  State<GenerateCode> createState() => _GenerateCodeState();
}

class _GenerateCodeState extends State<GenerateCode> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      appBar: AppBar(
        title: const Text(
          'Generate Your QR Code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 25,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: "Enter your name here : ",
                  labelStyle: TextStyle(
                    color: const Color(0xFF2A2A2A),
                    decoration: TextDecoration.none,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  )),
              onSubmitted: (value) {
                setState(() {
                  qrData = value;
                });
              },
            ),
            if (qrData != null)
              PrettyQrView.data(
                data: qrData!,
                decoration: const PrettyQrDecoration(
                  image: PrettyQrDecorationImage(
                    image: AssetImage('assets/icon.png'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
