import 'package:flutter/material.dart';
import 'package:medicine_tracker/components/reusable_input.dart';
import 'package:medicine_tracker/utils/constants.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
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
            ReusableInput(onChanged: (value) {}, hint: 'Doctor\'s Name'),
            const SizedBox(
              height: 10,
            ),
            ReusableInput(onChanged: (value) {}, hint: 'Complication'),
            const SizedBox(
              height: 10,
            ),
            ReusableInput(onChanged: (value) {}, hint: 'Date (YYYY-MM-DD)'),
            const SizedBox(
              height: 10,
            ),
            ReusableInput(onChanged: (value) {}, hint: 'Description'),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      Icons.image_search,
                      color: kPrimaryColor,
                    ),
                    Text(
                      'Insert An Image',
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: InkWell(
                  splashColor: kPrimaryColor,
                  child: Ink(
                    child: const Center(
                        child: Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
