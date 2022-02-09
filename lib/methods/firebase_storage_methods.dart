import 'package:firebase_storage/firebase_storage.dart' as _firebase_storage;

class StorageMethods {
  final _firebase_storage.FirebaseStorage _storage =
      _firebase_storage.FirebaseStorage.instance;

  Future<String> storeImage(file, path) async {
    _firebase_storage.TaskSnapshot task =
        await _storage.ref('medications').child(path).putFile(file);
    String downloadUrl = await task.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> storeUserPicture(file, path) async {
    _firebase_storage.TaskSnapshot taskSnapshot =
        await _storage.ref('users').child(path).putFile(file);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
