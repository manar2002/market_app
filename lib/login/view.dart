import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_router/app_router.dart';
import '../constants.dart';
import '../nav_bar/view.dart';
import '../sign_up/view.dart';
import '../widgets/confirm_button.dart';
import '../widgets/input_form_field.dart';
import '../widgets/my_text.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              data: 'Login',
              verticalMargin: 10,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
            MyText(
              data: 'Enter your email & password',
              fontSize: 16,
              color: kGrayColor,
            ),
            InputFormField(
              controller:emailController,
              verticalMargin: 30,
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: MyText(
                  data: 'Forget Password ?',
                  color: kBlackColor,
                ),
              ),
            ),
            ConfirmButton(
              title: "Login",
              onPressed: () async{
                if (formKey.currentState!.validate()) {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('email', emailController.text);
                  AppRouter.navigateAndPopAll(context,NavBarView(email: emailController.text,));
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Success')),
                );
                }
              }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyText(data: 'Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    AppRouter.navigateAndPopAll(context, SignUpView());
                  },
                  child: MyText(
                    data: 'Sign up',
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
