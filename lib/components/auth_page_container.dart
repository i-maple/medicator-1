import 'package:flutter/material.dart';
import 'package:medicine_tracker/utils/constants.dart';

class AuthPageContainer extends StatelessWidget {
  const AuthPageContainer({
    Key? key, required this.child
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.0)),
          color: kPrimaryColor),
    );
  }
}
