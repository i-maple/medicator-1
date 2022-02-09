import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/components/navbar.dart';
import 'package:medicine_tracker/components/reusable_container.dart';
import 'package:medicine_tracker/utils/constants.dart';

class ComplicationDetails extends StatefulWidget {
  final listId;
  const ComplicationDetails({Key? key, required this.listId}) : super(key: key);

  @override
  State<ComplicationDetails> createState() => _ComplicationDetailsState();
}

String complication = 'Complication...';
String doctor = 'doctor...';
String date = 'date...';
String description = 'Description...';
String imageUrl = 'Image';

class _ComplicationDetailsState extends State<ComplicationDetails> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    DocumentSnapshot snapshot =
        await _firestore.collection('medication').doc(widget.listId).get();
    setState(() {
      complication = snapshot.get('complication');
      doctor = snapshot.get('doctor');
      date = snapshot.get('date');
      description = snapshot.get('description');
      imageUrl = snapshot.get('imageUrl');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Navbar(),
              const SizedBox(
                height: 10,
              ),
              ReusableContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 28.0, horizontal: 15.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          complication,
                          style: kComplicationTextStyle,
                        ),
                        subtitle: Text(doctor),
                        trailing: Text(date),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        imageUrl,
                        height: 300,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Description',
                        style: kComplicationTextStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(description)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
