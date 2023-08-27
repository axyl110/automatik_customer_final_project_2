import 'package:automatik_customer_final_project/screens/loginPage.dart';
import 'package:automatik_customer_final_project/widgets/textfield.dart';
import 'package:automatik_customer_final_project/widgets/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showSpinner = false;
  late String email;
  late String password;
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController pass1C = TextEditingController();
  TextEditingController pass2C = TextEditingController();
  FocusNode emailFN = FocusNode();
  FocusNode nameFN = FocusNode();
  FocusNode addressFN = FocusNode();
  FocusNode phoneFN = FocusNode();
  FocusNode pass1FN = FocusNode();
  FocusNode pass2FN = FocusNode();
  bool hidePassword = true;
  bool hidePassword1 = true;

  ScrollController scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailC.dispose();
    nameC.dispose();
    addressC.dispose();
    phoneC.dispose();
    pass1C.dispose();
    pass2C.dispose();
    scrollController.dispose();

    super.dispose();
  }

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: TextFormField(
                validator: UnifiedValidators.emptyValidator,
                controller: nameC,
                focusNode: nameFN,
                textAlign: TextAlign.left,
                onEditingComplete: () {
                  nameFN.requestFocus();
                },
                keyboardType: TextInputType.name,
                decoration: textFieldDecoration.copyWith(
                  labelText: 'Name',
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: TextFormField(
                validator: UnifiedValidators.emptyValidator,
                controller: addressC,
                focusNode: addressFN,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.name,
                decoration: textFieldDecoration.copyWith(
                  labelText: 'Address',
                  prefixIcon: const Icon(
                    Icons.location_on_rounded,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: TextFormField(
                validator: UnifiedValidators.emailValidator,
                controller: emailC,
                focusNode: emailFN,
                textAlign: TextAlign.left,
                onEditingComplete: () {
                  phoneFN.requestFocus();
                },
                keyboardType: TextInputType.emailAddress,
                decoration: textFieldDecoration.copyWith(
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: TextFormField(
                validator: UnifiedValidators.emptyValidator,
                controller: phoneC,
                focusNode: phoneFN,
                textAlign: TextAlign.left,
                onEditingComplete: () {
                  pass1FN.requestFocus();
                },
                keyboardType: TextInputType.number,
                decoration: textFieldDecoration.copyWith(
                  labelText: 'Phone Number',
                  prefixIcon: const Icon(
                    Icons.phone,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: TextFormField(
                validator: UnifiedValidators.passwordValidator,
                controller: pass1C,
                focusNode: pass1FN,
                textAlign: TextAlign.left,
                onEditingComplete: () {
                  pass2FN.requestFocus();
                },
                obscureText: hidePassword,
                decoration: textFieldDecoration.copyWith(
                  labelText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(hidePassword
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2))
              ]),
              child: TextFormField(
                validator: (value) =>
                    MatchValidator(errorText: 'Password does not match')
                        .validateMatch(pass1C.text, pass2C.text),
                controller: pass2C,
                focusNode: pass2FN,
                textAlign: TextAlign.left,
                obscureText: hidePassword1,
                decoration: textFieldDecoration.copyWith(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(hidePassword1
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye),
                    onPressed: () {
                      setState(() {
                        hidePassword1 = !hidePassword1;
                      });
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alredy have an account?",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                TextButton(
                  child: Text(
                    "Login here",
                    style: TextStyle(color: Colors.grey[850]),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const LoginScreen()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}