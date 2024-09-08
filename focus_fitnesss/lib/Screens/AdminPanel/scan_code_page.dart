import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/AdminPanel/attendance_confirm.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCode extends StatefulWidget {
  const ScanCode({super.key});

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 60, 60),
      appBar: AppBar(
        title: const Text(
          'Scan QR Code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 20,
          color: Colors.white,
        ),
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            print('Barcode found! ${barcode.rawValue}');
          }
          if (image != null) {
            // showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(
            //         title: Text(
            //           barcodes.first.rawValue ?? "",
            //         ),
            //         content: Image(
            //           image: MemoryImage(image),
            //         ),
            //       );
            //     });
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => ConfirmAttendance(
                  qrData: barcodes.first.rawValue ?? "",
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
