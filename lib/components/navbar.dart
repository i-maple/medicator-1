import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/providers/auth_providers.dart';
import 'package:medicine_tracker/screens/login_screen.dart';
import 'package:medicine_tracker/utils/constants.dart';
import 'package:provider/provider.dart';

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
        trailing: !Provider.of<AuthProviders>(context, listen: false).isLoggedIn
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
                  Provider.of<AuthProviders>(context, listen: false).getLoggedIn();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.logout,
                  color: kPrimaryColor,
                )),
      ),
    );
  }
}
