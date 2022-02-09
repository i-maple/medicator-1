import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine_tracker/components/image_picker_widget.dart';
import 'package:medicine_tracker/components/reusable_button.dart';
import 'package:medicine_tracker/components/reusable_input.dart';
import 'package:medicine_tracker/methods/auth_methods.dart';
import 'package:medicine_tracker/methods/firebase_storage_methods.dart';
import 'package:medicine_tracker/methods/firestore_methods.dart';
import 'package:medicine_tracker/models/data_model.dart';
import 'package:medicine_tracker/screens/home_page.dart';
import 'package:medicine_tracker/utils/constants.dart';
import 'dart:io' as io;

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

XFile? _image;
bool imageInserted = false;

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _complicationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  pickImage() async {
    XFile? image = await DataModel().pickImages();
    if (image != null) {
      _image = image;
      setState(() {
        imageInserted = true;
      });
    }
  }

  storeIntoFirestore() async {
    String imageUrl =
        await StorageMethods().storeImage(io.File(_image!.path), _image!.name);

    var response = await FirestoreMethods().storeIntoDb(
        doctorName: _doctorController.text,
        complication: _complicationController.text,
        date: _dateController.text,
        description: _descriptionController.text,
        addedBy: AuthMethods().checkUser!.uid,
        imageUrl: imageUrl);

    if (response == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Data',
              style: kPrimaryTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ReusableInput(
              onChanged: (value) {},
              hint: 'Doctor\'s Name',
              controller: _doctorController,
            ),
            const SizedBox(
              height: 10,
            ),
            ReusableInput(
              onChanged: (value) {},
              hint: 'Complication',
              controller: _complicationController,
            ),
            const SizedBox(
              height: 10,
            ),
            ReusableInput(
              onChanged: (value) {},
              hint: 'Date (YYYY-MM-DD)',
              controller: _dateController,
            ),
            const SizedBox(
              height: 10,
            ),
            ReusableInput(
              onChanged: (value) {},
              hint: 'Description',
              controller: _descriptionController,
            ),
            const SizedBox(
              height: 20,
            ),
            ImagePickerWidget(
              imageInserted: imageInserted,
              onTap: pickImage,
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableButton(
              onTap: storeIntoFirestore,
            )
          ],
        ),
      ),
    );
  }
}

