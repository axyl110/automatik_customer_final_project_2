import 'package:automatik_customer_final_project/screens/navbar.dart';
import 'package:automatik_customer_final_project/widgets/auth_service.dart';
import 'package:automatik_customer_final_project/widgets/dimentions.dart';
import 'package:automatik_customer_final_project/widgets/roundedButton.dart';
import 'package:automatik_customer_final_project/widgets/textfield.dart';
import 'package:automatik_customer_final_project/widgets/validators.dart';
import 'package:flutter/material.dart';

import 'signupPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  FocusNode emailFN = FocusNode();
  FocusNode passwordFN = FocusNode();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight * 0.07),
              SizedBox(height: Dimensions.height20 + Dimensions.height10),
              const SizedBox(height: 10),
              TextFormField(
                validator: UnifiedValidators.emailValidator,
                controller: emailTextEditingController,
                focusNode: emailFN,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                onEditingComplete: () {
                  passwordFN.requestFocus();
                },
                style: const TextStyle(color: Colors.black),
                decoration: textFieldDecoration.copyWith(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              SizedBox(height: Dimensions.height20 + Dimensions.height10),
              TextFormField(
                validator: UnifiedValidators.passwordValidator,
                controller: passwordTextEditingController,
                focusNode: passwordFN,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                obscureText: hidePassword,
                onEditingComplete: () {
                  passwordFN.unfocus();
                },
                style: const TextStyle(color: Colors.blueAccent),
                decoration: textFieldDecoration.copyWith(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20.0),
              RoundedButton(
                color: Colors.lightBlueAccent,
                buttonTitle: 'LOGIN',
                buttonOnPressed: () async {
                  final message = await AuthController().login(
                      email: emailTextEditingController.text,
                      password: passwordTextEditingController.text);
                  if (message!.contains('Success')) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context, MaterialPageRoute(builder: (c) => NavBar()));
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet?",
                    style: TextStyle(color: Colors.grey[700], fontSize: 20),
                  ),
                  TextButton(
                    child: const Text(
                      "Click here",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const SignUpScreen()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
