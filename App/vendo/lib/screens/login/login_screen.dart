import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12),
                child: Row(
                  children: [
                    AppText.headingThree(
                        "Let's sign you in\nWelcome back\nYou have been missed")
                  ],
                ),
              ),
              verticalSpaceMedium,
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/user.png"),
                  fit: BoxFit.fitHeight,
                )),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [AppText.headline("Login")],
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: TextFormField(
                  cursorColor: colors.primary,
                  initialValue: 'Enter your number',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Contact',
                    labelStyle: TextStyle(
                      color: colors.primary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.primary),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                child: PasswordField(
                  color: colors.primary,
                  passwordConstraint: r'.*[@$#.*].*',
                  inputDecoration: PasswordDecoration(),
                  hintText: 'must have special characters',
                  border: PasswordBorder(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: colors.primary,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: colors.primary,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(width: 2, color: colors.primary),
                    ),
                  ),
                  errorMessage:
                      'must contain special character either . * @ # \$',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.mainPage);
                  },
                  child: AppText.buttonText("Login"),
                  style: ElevatedButton.styleFrom(
                      primary: colors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              verticalSpaceLarge,
              Row(
                children: [
                  Expanded(child: Container()),
                  AppText.bodyBold("New Vendor ?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.registerView);
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
