import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicine_tracker/methods/firebase_storage_methods.dart';
import 'package:medicine_tracker/methods/firestore_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  registerUser(
      {required String name,
      required String email,
      required String password,
      required File image,
      required String path}) async {
    String res = '';
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      String photoUrl = await StorageMethods().storeUserPicture(image, path);
      FirestoreMethods().registerUser(
          userId: credential.user!.uid, username: name, photoUrl: photoUrl);
      res = 'success';
    } catch (e) {
      res = 'Every Fields are required';
    }
    return res;
  }

  loginUser({required String email, required String password}) async {
    String res = '';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success';
    } catch (e) {
      res = 'Please Enter all the Fields';
    }
    return res;
  }

  User? get checkUser {
    return _auth.currentUser;
  }

  bool get checkLoggedIn {
    if (checkUser != null) {
      return true;
    }
    return false;
  }
}
