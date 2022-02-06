import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Widget? child;
  const ReusableContainer({
    Key? key, this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      decoration: const BoxDecoration(
          color: Color(0x11000000),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: child,
    );
  }
}
