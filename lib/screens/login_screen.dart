import 'package:flutter/material.dart';
import 'package:medicine_tracker/components/auth_page_container.dart';
import 'package:medicine_tracker/components/reusable_button.dart';
import 'package:medicine_tracker/components/reusable_container.dart';
import 'package:medicine_tracker/components/reusable_input.dart';
import 'package:medicine_tracker/methods/auth_methods.dart';
import 'package:medicine_tracker/providers/auth_providers.dart';
import 'package:medicine_tracker/screens/home_page.dart';
import 'package:medicine_tracker/screens/register_screen.dart';
import 'package:medicine_tracker/utils/constants.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String res = '';

  bool isLoading = false;

  loginUser() async {
  final _authProvider = Provider.of<AuthProviders>(context, listen: false);
    isLoading = Provider.of<AuthProviders>(context, listen: false).changeLoading();
    try {
      String res = await AuthMethods().loginUser(
          email: _usernameController.text, password: _passwordController.text);
      if (res == 'success') {
        _authProvider.getLoggedIn();
        isLoading = _authProvider.changeLoading();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      }
      setState(() {
        isLoading = false;
        res = 'Something went wrong';
      });
    } catch (e) {
      showSnackBar('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthPageContainer(
                child: Center(
                  child: Text(
                    'Log In to Add Your Record',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ),
              ReusableContainer(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(res),
                        ReusableInput(
                            onChanged: (value) {},
                            hint: 'Username',
                            controller: _usernameController),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ReusableInput(
                          onChanged: (value) {},
                          hint: 'Password',
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        ReusableButton(
                          onTap: loginUser,
                          buttonText: 'LOG IN',
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
                              'REGISTER',
                              style:
                                  TextStyle(fontSize: 18, color: kPrimaryColor),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const RegisterScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
