import 'package:flutter/material.dart';
import 'package:medicine_tracker/utils/constants.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(
          Icons.admin_panel_settings_sharp,
          size: 28,
          color: kPrimaryColor,
        ),
        title: Text('MEDICATOR PRIME'),
      ),
    );
  }
}
