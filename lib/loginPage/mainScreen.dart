import 'package:flutter/material.dart';

import '../constants/constantString.dart';
import '../reusableWidgets/Responsive.dart';
import '../reusableWidgets/createColor.dart';
import 'notUserSignup.dart';
import 'submitButton.dart';
import 'textFields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: screenWidth(context),
          height: screenHeight(context),
          decoration: pageDecoration(),
          
          child: SingleChildScrollView(
            child: bodyContainer(), // See below..........
          )),
    );
  }

  Container bodyContainer() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      width: ResponsiveWidget.isSmallScreen(context)
          ? screenWidth(context)
          : screenWidth(context) / 2,
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoApp(),
          loginText(context), // See below.........
          textFieldEmail(), // See textFields.dart..................
          textFieldPassword(), // See textFields.dart..................
          submitButton(), // See submitButton.dart..................
          notUserSignup(context), //See notUserSignup.dart..............
        ],
      ),
    );
  }

  logoApp() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.7)),
      margin: const EdgeInsets.only(bottom: 50),
      width: 150,
      child: CircleAvatar(
        backgroundImage: Image.asset(
          appLogo,
          width: 150,
          height: 130,
        ).image,
        radius: 85,
      ),
    );
  }
}

Widget loginText(context) {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 173, 20, 158),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20)),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Text("Login",
        style: TextStyle(
            fontSize: setSize(context, 30),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.normal)),
  );
}

BoxDecoration pageDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(colors: [
    Color.fromARGB(255, 180, 25, 167),
    Color.fromARGB(255, 237, 69, 231),
    Color.fromARGB(255, 230, 82, 183),
    Color.fromARGB(255, 243, 134, 208),
    Color.fromARGB(255, 220, 170, 204),
    Color.fromARGB(255, 173, 20, 158)
  ], stops: [
    0.1,
    0.2,
    0.3,
    0.5,
    0.9,
    1
  ], begin: Alignment.bottomLeft, end: Alignment.topRight));
}
