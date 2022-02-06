import 'package:flutter/material.dart';
import 'package:medicine_tracker/utils/constants.dart';

class ListItem extends StatelessWidget {
  final VoidCallback onPress;
  const ListItem({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: const ListTile(
        title: Text(
          'Typhoid',
          style: kComplicationTextStyle,
        ),
        trailing: Text('2078-10-19'),
        subtitle: Text('Dr. Anand Mehra'),
        style: ListTileStyle.list,
      ),
    );
  }
}
