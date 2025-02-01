import 'package:flutter/material.dart';
import 'package:seed_application/Screens/Login_Signup.dart';
import 'package:seed_application/Screens/Signup.dart';
import 'package:seed_application/custom_items/Custom_scaffold_welcome.dart';
import '../custom_items/welcome_button.dart';

class welcome_Screen extends StatelessWidget {
  const welcome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWelcome(
      child: Column(
        children: [
          Flexible(
              flex: 2,
              child: Center(
                  child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text: "Welcome Back!\n",
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600,
                      )),
                  TextSpan(
                      text: "Enter Your Details To Sign in",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ))
                ]),
              ))),
          const Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Expanded(child: WelcomeButton(
                        buttonText: "Sign in",
                      onTap: SignUpScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),

                    ),
                    Expanded(child: WelcomeButton(
                        buttonText: "Sign up",
                      onTap: SignupPage(),
                      color: Colors.white,
                      textColor:Color(0xFF289306) ,
                    ),

                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
