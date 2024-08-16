
import 'package:flutter/material.dart';
import 'package:myobat_application/components/my_button.dart';
import 'package:myobat_application/components/my_textfield.dart';
import 'package:myobat_application/components/my_dialog.dart';
import 'package:myobat_application/pages/home_page.dart';
import 'package:myobat_application/services/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';


class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final api = Auth();

  final storage = const FlutterSecureStorage();
  bool results = false;

  // Sign User In
  Future<void> signUserIn() async {
    final email = emailController.text;
    final password = passwordController.text;

    showLoadingDialog();

    if (email.isEmpty || password.isEmpty) {
      Navigator.pop(context); // Close the loading dialog
      showIncompleteFields();
      return;
    }

    try {
      final response = await api.login(email, password);
      Navigator.pop(context); // Close the loading dialog

      // Check response status code
      if (response == false) {
        wrongEmailDialog();
      } else {
        goToHomePage();
      }
    } catch (e) {
      Navigator.pop(context);
      print('Error: $e');
      showErrorDialog();
    }
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void wrongEmailDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyDialog(
          title: 'Invalid Login Credentials',
          content: 'Invalid email or password',
        );
      },
    );
  }

  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyDialog(
          title: 'Error',
          content: 'Unable to log in at the moment',
        );
      },
    );
  }

  void showIncompleteFields() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyDialog(
          title: 'Incomplete Fields',
          content: 'Must enter both email and password',
        );
      },
    );
  }

  void goToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeProvider.themeData.colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),

              // Lock Icon
              // const Icon(
              //   Icons.lock,
              //   size: 100,
              // ),

              // Our NONE Logo
              Image.asset(
                'lib/images/none-logo-3.png',
                height: 100,
              ),

              const SizedBox(height: 50),

              // Welcome Text
              Text(
                'Hello!, Welcome to MyObat',
                style: TextStyle(
                  color: themeProvider.themeData.colorScheme.secondary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // email Textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password Textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // Sign in
              MyButton(
                text: "Sign In",
                onTap: signUserIn,
              ),

              const SizedBox(height: 25),

              // register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        color: themeProvider.themeData.colorScheme.secondary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
