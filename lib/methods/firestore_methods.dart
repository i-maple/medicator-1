import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  storeIntoDb(
      {required String doctorName,
      required String addedBy,
      required String complication,
      required String date,
      required String description,
      required String imageUrl}) async {
    String returnRes = 'failed';
    try {
      await _firestore.collection('medication').add({
        'doctor': doctorName,
        'complication': complication,
        'complicationForSearch' : complication.toLowerCase(),
        'date': date,
        'addedBy' : addedBy,
        'description': description,
        'imageUrl': imageUrl
      });
      returnRes = 'success';
    } catch (e) {
      returnRes = 'failed';
    }
    return returnRes;
  }

  registerUser({required String userId, required String username, required String photoUrl}) async {
    await _firestore.collection('users').doc(userId).set({
      'username' : username,
      'photoUrl' : photoUrl
    });
  }
}
