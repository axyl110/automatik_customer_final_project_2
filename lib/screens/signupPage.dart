import 'package:automatik_customer_final_project/screens/homePage.dart';
import 'package:automatik_customer_final_project/screens/loginPage.dart';
import 'package:automatik_customer_final_project/widgets/auth_service.dart';
import 'package:automatik_customer_final_project/widgets/dimentions.dart';
import 'package:automatik_customer_final_project/widgets/roundedButton.dart';
import 'package:automatik_customer_final_project/widgets/textfield.dart';
import 'package:automatik_customer_final_project/widgets/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
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

  Future uploadInfo() async {
    try {
      AuthController().signUpUser(
          nameC.text, addressC.text, emailC.text, pass2C.text, phoneC.text);
      Get.to(() => HomeScreen());
    } catch (e) {
      print('error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.07),
            SizedBox(height: Dimensions.height20 + Dimensions.height10),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.height30, right: Dimensions.height30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: [
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
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.height30, right: Dimensions.height30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: [
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
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.height30, right: Dimensions.height30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: [
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
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.height30, right: Dimensions.height30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: [
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
                    color: Colors.black,
                    Icons.phone,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.height30, right: Dimensions.height30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: [
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
                    color: Colors.black,
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
            SizedBox(height: Dimensions.height10),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.height30, right: Dimensions.height30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: [
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
                    color: Colors.black,
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
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: RoundedButton(
                buttonTitle: 'Register',
                color: Colors.teal.shade200,
                buttonOnPressed: () async {
                  uploadInfo();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alredy have an account?",
                  style: TextStyle(color: Colors.grey[700], fontSize: 20),
                ),
                TextButton(
                  child: const Text(
                    "Login here",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
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
