import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({Key? key, required this.onTap, this.buttonText = 'ADD'}) : super(key: key);

  final String buttonText;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor,
          child: Ink(
            child:  Center(
                child: Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            )),
          ),
        ),
      ),
    );
  }
}
