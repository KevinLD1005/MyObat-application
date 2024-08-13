import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// pages
import 'package:myobat_application/pages/login_or_register.dart';
import 'package:myobat_application/pages/home_page.dart';

// utils
import 'package:myobat_application/theme/theme_provider.dart';
import 'package:myobat_application/services/auth.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: const MyObat(),
    ),
  );
}

class MyObat extends StatelessWidget {
  // const MyObat({Key? key}) : super(key: key);
  const MyObat({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<Auth>(context, listen: false);
    final storage = FlutterSecureStorage();
    // const storage = FlutterSecureStorage();

    Future<bool> readToken() async {
      try {
        String? token = await storage.read(key: 'token');
        if (token != null && token.isNotEmpty) {
          bool isAuthenticated = await authProvider.tryToken(token: token);
          return isAuthenticated;
        } else {
          return false;
        }
      } catch (e) {
        print('Error reading token: $e');
        return false;
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      home: FutureBuilder<bool>(
        future: readToken(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError || snapshot.data == false) {
            return const LoginOrRegister();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => ThemeProvider(),
//         ),
//       ],
//       child: const MyObat(),
//     ),
//   );
// }

