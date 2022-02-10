import 'package:flutter/material.dart';
import 'package:medicine_tracker/components/navbar.dart';
import 'package:medicine_tracker/components/reusable_container.dart';
import 'package:medicine_tracker/methods/auth_methods.dart';
import 'package:medicine_tracker/screens/add_screen.dart';
import 'package:medicine_tracker/screens/login_screen.dart';
import 'package:medicine_tracker/utils/constants.dart';

import '../components/list_tile.dart';
import '../components/reusable_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String searchValue = '';
  bool searchState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (AuthMethods().checkLoggedIn) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddScreen(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            );
          }
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 28.0, horizontal: 15.0),
                  child: ListView(
                    children: [
                      ReusableInput(
                        onChanged: (value) {
                          setState(() {
                            searchValue = value;
                            if (searchValue != null) {
                              searchState = true;
                            }
                            if (searchValue == '') {
                              searchState = false;
                            }
                          });
                        },
                        controller: _searchController,
                        hint: 'Enter Complication',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListItem(
                        searchText: _searchController.text,
                        searchState: searchState,
                      )
                    ],
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
