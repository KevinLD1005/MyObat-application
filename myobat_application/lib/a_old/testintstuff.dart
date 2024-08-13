// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:learningui/pages/home_page.dart';
// import 'package:learningui/utils/icons_sty.dart';
// import 'package:learningui/utils/text_sty.dart';
// import 'package:learningui/utils/utils.dart';
// import 'package:provider/provider.dart';

// import '../../services/auth.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final storage = FlutterSecureStorage();

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   late String email;
//   late String password;

//   bool results = false;
//   String errorMessage = '';

//   bool isObscure = true;

//   Future readToken() async {
//     // await Future.delayed(Duration(seconds: 2));
//     String? token = await storage.read(key: 'token');

//     if (token != null) {
//       results = await Provider.of<Auth>(context, listen: false)
//           .tryToken(token: token);

//       if (results == true) {
//         // print(results);

//         return true;
//       } else {
//         return false;
//       }
//     } else {
//       return false;
//     }
//   }

//   Future<void> submitForm() async {
//     bool result =
//         await Provider.of<Auth>(context, listen: false).login(email, password);

//     log('$result');

//     if (result == false) {
//       if (mounted) {
//         setState(() {
//           //  errorMessage = 'There was a problem with your credentials.';
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Please Your Check Connection Server'),
//             ),
//           );
//         });
//       }
//     } else {
//       if (mounted) {
//         setState(() {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) {
//                 return HomePage();
//               },
//             ),
//           );
//         });
//       }
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState

//     emailController.text = 'sandy@gmail.com';
//     passwordController.text = '12345';

//     /** Disable jika default login tidak di butuhkan lagi */

//     super.initState();
//     // readToken();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose

//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CloneTheme.mainBlue,
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image(
//                 image: AssetLocations.iconLocation('friend_3'),
//                 width: 150,
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.white,
//                       width: 2.0,
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   prefixIcon: IconsSty(
//                     icon: Icons.account_box_rounded,
//                     color: CloneTheme.orange,
//                   ),
//                   hintText: 'Your Email',
//                   hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange, width: 2.0),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//                 cursorColor: CloneTheme.white,
//                 controller: emailController,
//                 style: TextStyle(color: Colors.white),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please Enter Your Email' : null,
//                 onSaved: (value) => email = value!,
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 obscureText: isObscure,
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.white,
//                       width: 2.0,
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange, width: 2.0),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   prefixIcon: IconsSty(
//                     icon: Icons.key,
//                     color: CloneTheme.orange,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isObscure ? Icons.visibility : Icons.visibility_off,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(
//                         () {
//                           isObscure = !isObscure;
//                         },
//                       );
//                     },
//                   ),
//                   hintText: 'Your Password',
//                   hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
//                 ),
//                 cursorColor: CloneTheme.white,
//                 style: TextStyle(color: Colors.white),
//                 controller: passwordController,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please Enter Your Password' : null,
//                 onSaved: (value) => password = value!,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 16),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width - 115,
//                   child: TextButton(
//                     onPressed: () {
//                       if (_formKey.currentState == null) {
//                         print("_formKey.currentState is null!");
//                       } else if (_formKey.currentState!.validate()) {
//                         _formKey.currentState!.save();
//                         // print(creds);
//                         submitForm();
//                         // print(email);
//                         // Provider.of<Auth>(context, listen: false)
//                         //     .login(creds: creds);

//                         // Navigator.pop(context);
//                       }
//                       // if (_formKey.currentState!.validate()) {
//                     },
//                     style: TextButton.styleFrom(
//                         foregroundColor: CloneTheme.white,
//                         backgroundColor: CloneTheme.orange),
//                     child: TextSty(
//                       title: 'Login',
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
