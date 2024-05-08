import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.contactNumber,
    required this.userUid,
    required this.schedule,
    required this.imageUrl,
  });

  final String userName;
  final String userEmail;
  final String contactNumber;
  final String userUid;
  final String schedule;
  final String imageUrl;

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final _form = GlobalKey<FormState>();

  String currentSchedule = "";
  String? selectedSchedule;

  void submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    FocusScope.of(context).unfocus();

    print(selectedSchedule);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userUid)
        .set({
      "image-url": widget.imageUrl,
      "user-uid": widget.userUid,
      "name": widget.userName,
      "email": widget.userEmail,
      "contact-number": widget.contactNumber,
      "schedule": selectedSchedule,
    });

    Navigator.of(context).pop();
  }

  void deleteUser(String userUID) async {
    await FirebaseFirestore.instance.collection("users").doc(userUID).delete();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.schedule == "") {
      currentSchedule = "Not available";
    } else {
      currentSchedule = widget.schedule;
    }
    print(widget.schedule);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Name : ${widget.userName}"),
            Text("Email : ${widget.userEmail}"),
            Text("Contact number : ${widget.contactNumber}"),
            Text("Schedule : $currentSchedule"),
            Text(widget.userUid),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                deleteUser(widget.userUid);
              },
              child: const Text("Remove member"),
            ),
            Form(
              key: _form,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: DropdownButtonFormField<String>(
                      value: selectedSchedule,
                      dropdownColor: const Color.fromARGB(195, 255, 255, 255),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSchedule = newValue;
                        });
                      },
                      items: <String>['Plan1', 'Plan2', 'Plan3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        );
                      }).toList(),
                      hint: const Text(
                        "Select schedule",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      onSaved: (value) {
                        selectedSchedule = value;
                      },
                      validator: (value) {
                        if (selectedSchedule == null) {
                          return "Select Schedule";
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: submit,
                    child: const Text("Edit member schedule"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
