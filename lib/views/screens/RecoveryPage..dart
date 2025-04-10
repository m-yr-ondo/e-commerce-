import 'package:flutter/material.dart';
import 'package:login/configs/mycolors.dart';
import 'package:login/views/widgets/mybutton.dart';
import 'package:login/views/widgets/textfield.dart';

class RecoveryPage extends StatelessWidget {
  const RecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

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
                'Password Recovery',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              myTextField(
                hintText: "Enter your email",
                controller: emailController,
                fillColor: Colors.white,
                textColor: Colors.white,
                hintTextColor: Colors.grey,
              ),
              SizedBox(height: 30),
              myButton(() {
                // Simulate sending a recovery email
                String email = emailController.text.trim();
                if (email.isNotEmpty) {
                  print("Recovery email sent to: $email");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Recovery email sent to $email"),
                      backgroundColor: mainColor,
                    ),
                  );
                  Navigator.pop(context); // Navigate back to Login Page
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter a valid email"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }, label: "Send Recovery Email", color: mainColor),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember your password? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: mainColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context); // Navigate back to Login Page
                    },
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