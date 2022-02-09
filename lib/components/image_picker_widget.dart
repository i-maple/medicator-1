import 'package:flutter/material.dart';
import 'package:medicine_tracker/utils/constants.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({Key? key, this.imageInserted = false, required this.onTap})
      : super(key: key);

  final bool imageInserted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.image_search,
                color: kPrimaryColor,
              ),
              Text(
                imageInserted ? 'Image Inserted' : 'Insert An Image',
              )
            ],
          ),
        ),
      ),
    );
  }
}
