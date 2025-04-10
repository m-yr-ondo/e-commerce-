import 'package:flutter/material.dart';
import 'package:login/configs/mycolors.dart';
import 'package:login/controllers/DisplayController.dart';
import 'package:login/views/widgets/mybutton.dart';
import 'package:login/views/widgets/textfield.dart';
import 'package:login/views/screens/RegistrationPage.dart';
import 'package:login/views/screens/RecoveryPage..dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'RecoveryPage..dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    DisplayController displayController = DisplayController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 20, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/pic.png",
                height: 100,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              myTextField(
                hintText: "Enter username",
                controller: userNameController,
                fillColor: Colors.white,
                textColor: Colors.white,
                hintTextColor: Colors.white,
              ),
              SizedBox(height: 20),
              myTextField(
                hintText: "Enter password",
                controller: passwordController,
                fillColor: Colors.white,
                textColor: Colors.white,
                hintTextColor: Colors.white,
              ),
              SizedBox(height: 30),
              myButton(() async {

                final SharedPreferences prefs =
                await SharedPreferences.getInstance();
                prefs.setBool('isLoggedIn', true);
                Navigator.pushReplacementNamed(context, '/landing');
              }, label: "Login", color: mainColor),

              SizedBox(height: 30),

              myButton(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage()),
                );

              }, label: "SignUp", color: mainColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: mainColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecoveryPage()),
                      );
                    },
                  ),
                ],
              ),
              Obx(() => Text(
                displayController.errorMessage.value,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}