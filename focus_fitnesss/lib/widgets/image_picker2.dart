import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker2 extends StatefulWidget {
  const ImagePicker2({super.key, required this.onPickedImage});

  final void Function(File pickedImage) onPickedImage;

  @override
  State<ImagePicker2> createState() => _ImagePicker2State();
}

class _ImagePicker2State extends State<ImagePicker2> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickedImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              // Your background container properties
              width: 200,
              height: 200,
              color: Colors.blue,
              // You can add more styling here
            ),
            Positioned(
              top: 20, // Adjust this according to your needs
              left: 20, // Adjust this according to your needs
              child: Image.asset(
                'assets/google.png', // Path to your foreground image
                width: 100, // Adjust this according to your needs
                height: 100, // Adjust this according to your needs
              ),
            ),
          ],
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(
            Icons.person,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: const Text(
            "Add image",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    );
  }
}
