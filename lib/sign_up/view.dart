import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app_router/app_router.dart';
import '../constants.dart';
import '../login/view.dart';
import '../widgets/confirm_button.dart';
import '../widgets/input_form_field.dart';
import '../widgets/my_text.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            Image.asset(
              getAsset('colored-logo'),
              height: 50,
              width: 50,
            ),
            SizedBox(height: getHeight(context, 13, subtractAppBar: false),),
            const MyText(
              data: 'Sign Up',
              verticalMargin: 10,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
            MyText(
              data: 'Enter your credentials to continue',
              fontSize: 16,
              color: kGrayColor,
            ),
            const SizedBox(height: 30),
            InputFormField(
              controller: usernameController,
              labelText: 'Username',
              validator:(value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            InputFormField(
              controller: emailController,
              verticalMargin: 20,
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator:(value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            InputFormField(
              controller: passwordController,
              labelText: 'Password',
              secure: true,
              validator:(value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RichText(
                text: TextSpan(
                  text: 'By continuing you agree to our ',
                  style: TextStyle(
                    color: kGrayColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: kGrayColor,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                if (kDebugMode) {
                                  print('Privacy Policy.');
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ConfirmButton(
              title: "Sign Up",
              onPressed: (){
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Success')),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyText(data: 'Have an account?'),
                TextButton(
                  onPressed: () => AppRouter.navigateAndPopAll(context, LoginView()),
                  child: MyText(
                    data: 'Login now',
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
