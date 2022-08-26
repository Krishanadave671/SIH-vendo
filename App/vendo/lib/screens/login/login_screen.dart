import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:passwordfield/passwordfield.dart';

import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';
import 'package:vendo/util/string.dart';

import '../../services/dio_client.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _phonenoController.dispose();
    _passwordController.dispose();
  }

  void signInUser(BuildContext context) async {
    try {
      final _api = ref.watch(apiserviceProvider);
      log(_phonenoController.text);
      log(_passwordController.text);
      await _api.login(
          _phonenoController.text, _passwordController.text, context, ref);
    } catch (e) {
      showSnackBar(
        context,
        "Error Logging In!!",
      );
    }
  }

  late bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12),
                child: Row(
                  children: [
                    AppText.headingThree(StringsList.translate["signIn"]!),
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
                  children: [AppText.headline(StringsList.translate["login"]!)],
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: TextFormField(
                  controller: _phonenoController,
                  cursorColor: colors.primary,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Contact",
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.primary),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
                child: PasswordField(
                  controller: _passwordController,
                  color: colors.primary,
                  passwordConstraint: r'.*[@$#.*].*',
                  inputDecoration: PasswordDecoration(),
                  //hintText: 'must have special characters',
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
                  errorMessage: StringsList.translate["password"],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  onPressed: () {
                    signInUser(context);
                  },
                  child: AppText.buttonText(StringsList.translate["loginbtn"]!),
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
                  AppText.bodyBold(StringsList.translate["newVendor"]!),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.registerView);
                    },
                    child: Text(
                      StringsList.translate["register"]!,
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
