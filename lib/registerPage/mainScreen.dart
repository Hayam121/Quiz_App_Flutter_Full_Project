import 'package:flutter/material.dart';

import '../reusableWidgets/Responsive.dart';
import 'alreadyUserLogin.dart';
import 'submitButton.dart';
import 'textFields.dart';
import 'toggleButtons.dart';

class Register extends StatefulWidget { // represents the screen for the user register 
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        alignment: Alignment.center,
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: pageDecoration(),
        child: SingleChildScrollView(child: bodyContainer()),
      ),
    );
  }

  Container bodyContainer() {
    return Container(
      width: ResponsiveWidget.isSmallScreen(context)
          ? screenWidth(context)
          : screenWidth(context) / 2,
      margin: EdgeInsets.symmetric(vertical: setSize(context, 20)),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          registerText(),
          toggleForStudentFaculty(),
          textFieldName(),
          textFieldEmail(),
          textFieldPassword(),
          buttonSubmit(),
          alreadyUserLogin(context),
        ],
      ),
    );
  }

  Widget registerText() {
    return Text(
      "Register Now",
      style: TextStyle(
          fontSize: setSize(context, 35),
          fontWeight: FontWeight.w800,
          color: Colors.white),
    );
  }

  BoxDecoration pageDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(255, 180, 25, 167),
      Color.fromARGB(255, 237, 69, 231),
      Color.fromARGB(255, 223, 22, 159),
      Color.fromARGB(255, 243, 134, 208),
      Color.fromARGB(255, 220, 170, 204),
      Color.fromARGB(255, 173, 20, 158)
    ], stops: [
      0.1,
      0.3,
      0.5,
      0.6,
      0.8,
      1
    ], begin: Alignment.bottomRight, end: Alignment.topLeft));
  }
}
