import 'package:flutter/material.dart';
import 'package:medicine_tracker/components/navbar.dart';
import 'package:medicine_tracker/components/reusable_container.dart';
import 'package:medicine_tracker/screens/add_screen.dart';
import 'package:medicine_tracker/screens/complication_details.dart';
import 'package:medicine_tracker/utils/constants.dart';

import '../components/list_tile.dart';
import '../components/reusable_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddScreen(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Navbar(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Track Your Medicine with',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              const Text(
                'Medicator Prime',
                style: kPrimaryTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ReusableContainer(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 28.0, horizontal: 15.0),
                    children: [
                      ReusableInput(
                        onChanged: (value) {},
                        hint: 'Enter Complication',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListItem(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ComplicationDetails(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),);
  }
}
