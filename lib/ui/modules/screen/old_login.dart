// import 'package:flutter/material.dart';
// import 'dart:developer';
// import 'package:ig/ui/modules/screen/feed.dart';

// // import 'package:ig/ui/modules/widgets/line.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _controller = TextEditingController();
//   final TextEditingController _pcontroller = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   bool _isPasswordVisible = false;
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   _showForgotPasswordDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: const Text("OK"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: const Color.fromARGB(255, 131, 94, 94),
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Form(
//               key: _formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(32),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Instagram",
//                       style: TextStyle(
//                         fontFamily: "S",
//                         fontSize: 60,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       controller: _controller,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Enter data";
//                         }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                         hintText: "Phone number, username or email",
//                       ),
//                     ),
//                     TextFormField(
//                       controller: _pcontroller,
//                       obscureText: !_isPasswordVisible,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Wrong password";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         suffix: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               _isPasswordVisible = !_isPasswordVisible;
//                             });
//                           },
//                           icon: Icon(
//                             _isPasswordVisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     InkWell(
//                       onTap: _showForgotPasswordDialog,
//                       child: const Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           "Forgot password?",
//                           style: TextStyle(
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     InkWell(
//                       onTap: () {},
//                       child: ElevatedButton(
//                         onPressed: () {
//                           log(_controller.text);
//                           log(_pcontroller.text);

//                           if (_formKey.currentState!.validate()) {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                   builder: (context) => const FeedScreen()),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: const SizedBox(
//                           height: 40,
//                           width: 330,
//                           child: Center(
//                             child: Text(
//                               "Log in",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Row(
//                       children: [
//                         Expanded(
//                           child: Divider(
//                             color: Color.fromARGB(255, 127, 127, 127),
//                             thickness: 1,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             "OR",
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 127, 127, 127),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Divider(
//                             color: Color.fromARGB(255, 127, 127, 127),
//                             thickness: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.facebook_sharp,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         const Text(
//                           "Continue as Ram Prasad",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: Padding(
//           //     padding: const EdgeInsets.all(16.0),
//           // child:

//           // SizedBox(
//           //   height: MediaQuery.of(context).size.height * 0.13,
//           // ),

//           RichText(
//             text: const TextSpan(
//               text: "Don't have an account? ",
//               style: TextStyle(color: Colors.grey),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: 'Sign Up.',
//                   style: TextStyle(
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
