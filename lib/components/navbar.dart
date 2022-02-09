import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/methods/auth_methods.dart';
import 'package:medicine_tracker/screens/login_screen.dart';
import 'package:medicine_tracker/utils/constants.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.admin_panel_settings_sharp,
          size: 28,
          color: kPrimaryColor,
        ),
        title: const Text('MEDICATOR PRIME'),
        trailing: AuthMethods().checkUser == null
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.login,
                  color: kPrimaryColor,
                ))
            : GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return const Text('Logged Out Successfully', style: kPrimaryTitle,);
                      });
                },
                child: const Icon(
                  Icons.logout,
                  color: kPrimaryColor,
                )),
      ),
    );
  }
}
