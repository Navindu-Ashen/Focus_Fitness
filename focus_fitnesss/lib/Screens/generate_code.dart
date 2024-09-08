import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:flutter/services.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  String qrData = "hello world"; // QR Data
  GlobalKey qrKey = GlobalKey(); // Key to capture the QR code as an image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      appBar: AppBar(
        title: const Text(
          'Generate and Save QR Code',
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
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Displaying the QR Code
            RepaintBoundary(
              key: qrKey, // Key for capturing the widget
              child: PrettyQr(
                data: qrData,
                size: 200,
                errorCorrectLevel: QrErrorCorrectLevel.M,
                roundEdges: true,
              ),
            ),
            ElevatedButton(
              onPressed: saveQRCodeToFile,
              child: const Text('Save QR Code as Image'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to capture and save the QR code as an image to the device
  Future<void> saveQRCodeToFile() async {
    try {
      // Capture the QR code widget as an image
      RenderRepaintBoundary boundary =
          qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Get the directory to save the file
      final directory = await getExternalStorageDirectory();
      final imagePath = '${directory!.path}/qr_code.png';

      // Save the image as a PNG file
      final file = File(imagePath);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("user-qr")
          .child("test.jpg");

      await storageRef.putFile(await file.writeAsBytes(pngBytes));
      final imageUrl = await storageRef.getDownloadURL();
      print(imageUrl);

    } catch (e) {
      print("Error saving QR code: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving QR code")),
      );
    }
  }
}
