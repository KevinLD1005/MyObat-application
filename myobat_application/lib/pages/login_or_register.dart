import 'package:flutter/material.dart';
// import 'package:myobat_application/pages/login_or_register.dart';
import 'package:myobat_application/pages/login_page.dart';
import 'package:myobat_application/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // show login page
  bool showLoginPage = true;

  // to toggle between pages
  void togglePages() {
    setState(
      () {
        showLoginPage = !showLoginPage;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
