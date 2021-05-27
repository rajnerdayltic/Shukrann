// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shukranngrp/utils/form_helper.dart';
//
// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
//
//   String _username = "";
//   String _pwd = "";
//   bool hidePassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade100,
//         key: _scaffoldKey,
//         body: _loginUiSetUp(context),
//       ),
//     );
//   }
//
//   Widget _loginUiSetUp(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: Form(
//           key: globalFormKey,
//           child: _loginUi(context),
//         ),
//       ),
//     );
//   }
//
//   Widget _loginUi(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 3.5,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.redAccent, Colors.redAccent],
//             ),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(150.0),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Spacer(),
//               Align(
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   'images/welcome.png',
//                   fit: BoxFit.contain,
//                   width: 140.0,
//                 ),
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//         Center(
//           child: Padding(
//             padding: EdgeInsets.only(bottom: 20.0, top: 40.0),
//             child: Text(
//               'LOGIN',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
//           child: FormHelper.inputFieldWidget(
//             context,
//             Icon(
//               Icons.verified_user,
//               color: Colors.deepOrange,
//             ),
//             "username",
//             "Username",
//             (onValidateVal) {
//               if (onValidateVal.isEmpty) {
//                 return 'Username can\'t be Empty';
//               }
//               return null;
//             },
//             (onSavedVal) {
//               _username.toString().trim();
//             },
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: 20.0),
//           child: FormHelper.inputFieldWidget(
//             context,
//             Icon(Icons.lock),
//             "password",
//             "Password",
//             (onValidateVal) {
//               if (onValidateVal.isEmpty) {
//                 return 'Password can\'t be Empty';
//               }
//               return null;
//             },
//             (onSavedVal) {
//               _pwd.toString().trim();
//             },
//             initialValue: "",
//             obscureText: hidePassword,
//             suffixIcon: IconButton(
//               onPressed: () {
//                 setState(() {
//                   hidePassword = !hidePassword;
//                 });
//               },
//               color: Colors.redAccent.withOpacity(0.4),
//               icon: Icon(
//                 hidePassword ? Icons.visibility_off : Icons.visibility,
//                 color: Colors.redAccent,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Center(
//           child: FormHelper.saveButton('LOGIN', () {
//             if (validateAndSave()) {}
//           }),
//         )
//       ],
//     );
//   }
//
//   bool validateAndSave() {
//     final form = globalFormKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
// }
