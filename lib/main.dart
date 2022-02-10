import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/providers/auth_providers.dart';
import 'package:medicine_tracker/screens/home_page.dart';
import 'package:medicine_tracker/utils/constants.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProviders())
      ],
      child: MaterialApp(
        theme: themeData,
        home: const HomePage(),
      ),
    ),
  );
}
