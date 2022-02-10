import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine_tracker/components/auth_page_container.dart';
import 'package:medicine_tracker/components/image_picker_widget.dart';
import 'package:medicine_tracker/components/reusable_button.dart';
import 'package:medicine_tracker/components/reusable_container.dart';
import 'package:medicine_tracker/components/reusable_input.dart';
import 'package:medicine_tracker/methods/auth_methods.dart';
import 'package:medicine_tracker/models/data_model.dart';
import 'package:medicine_tracker/screens/home_page.dart';
import 'package:medicine_tracker/screens/login_screen.dart';
import 'package:medicine_tracker/utils/constants.dart';
import 'package:provider/provider.dart';
import 'dart:io' as io;

import '../providers/auth_providers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  XFile? _image;
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool imageInserted = false;
  final TextEditingController _nameEditingController = TextEditingController();

  registerUser() {
    setState(() {
      isLoading = true;
    });
    String res = AuthMethods().registerUser(
        name: _nameEditingController.text,
        email: _emailController.text,
        password: _passwordController.text,
        image: io.File(_image!.path),
        path: _image!.path);

    if (res == 'success') {
      Provider.of<AuthProviders>(context).getLoggedIn();

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      setState(() {
        isLoading = false;
        res = 'Something went wrong';
      });
    }
  }

  pickImage() async {
    XFile? image = await DataModel().pickImages();
    if (image != null) {
      _image = image;
      setState(() {
        imageInserted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AuthPageContainer(
            child: Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
          ReusableContainer(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ReusableInput(
                        onChanged: (value) {},
                        hint: 'Email',
                        controller: _emailController),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ReusableInput(
                      onChanged: (value) {},
                      hint: 'Password',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ReusableInput(
                      onChanged: (value) {},
                      hint: 'Name',
                      controller: _nameEditingController,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ImagePickerWidget(
                      onTap: pickImage,
                      imageInserted: imageInserted,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ReusableButton(
                      onTap: registerUser,
                      buttonText: 'SIGN UP',
                    ),
                    isLoading
                        ? const CircularProgressIndicator(
                            color: kPrimaryColor,
                          )
                        : const Text(''),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const Center(
                      child: Text('OR'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: GestureDetector(
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 18, color: kPrimaryColor),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
