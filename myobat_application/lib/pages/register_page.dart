import 'package:dio/dio.dart' as api;
import 'package:myobat_application/services/dio.dart';
import 'package:flutter/material.dart';
import 'package:myobat_application/components/my_button.dart';
import 'package:myobat_application/components/my_textfield.dart';
import 'package:myobat_application/pages/login_or_register.dart';
import 'package:myobat_application/components/my_dialog.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Sign User Up
  void register() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    // Show loading circle
    showLoadingDialog();

    // Check if any field is empty
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Navigator.pop(context); // Close the dialog
      showIncompleteDialog();
      return;
    }

    // if password does not match
    if (password != confirmPassword) {
      Navigator.pop(context); // Close the dialog
      passwordNotSame();
      return;
    }

    try {
      final data = {
        "name": name,
        "email": email,
        "password": password,
        "device_name": "mobile",
      };

      api.Response response = await dio().post('/register', data: data);
      // Close the dialog
      Navigator.pop(context);

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData['status'] == 1) {
          goToLoginOrRegisterPage();
        }
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

  void passwordNotSame() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyDialog(
          title: 'Error',
          content: 'Password does not match',
        );
      },
    );
  }

  void showIncompleteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const MyDialog(
          title: 'Error',
          content: 'Incomplete fields',
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
          content: 'Unable to regiter at the moment',
        );
      },
    );
  }

  void goToLoginOrRegisterPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginOrRegister(),
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

              // Don't have an account? Register now
              Text(
                'Don\'t have an account? Register now',
                style: TextStyle(
                  color: themeProvider.themeData.colorScheme.secondary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // name Textfield
              MyTextField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false,
              ),

              const SizedBox(height: 10),

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

              // Confirm password Textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // Sign Up
              MyButton(
                text: 'Register',
                onTap: register,
              ),

              const SizedBox(height: 25),

              // register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: themeProvider.themeData.colorScheme.secondary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
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
