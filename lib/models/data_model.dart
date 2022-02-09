import 'package:image_picker/image_picker.dart';

class DataModel {
  pickImages() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    return pickedImage;
  }
}
