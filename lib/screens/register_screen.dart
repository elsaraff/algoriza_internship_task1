import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../core/cache_helper.dart';
import '../core/constants.dart';
import '../core/functions.dart';
import '../reusable_components/my_button.dart';
import '../reusable_components/my_text_button.dart';
import '../reusable_components/my_text_form.dart';
import 'home_page.dart';
import 'sign_in_screen.dart';

String registerNumber = '';

class RegisterScreen extends StatefulWidget {
  final bool canBack;
  const RegisterScreen({Key? key, required this.canBack}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                const Image(
                  image: AssetImage('assets/images/back.png'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                if (widget.canBack)
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.8)),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_sharp,
                            color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Welcome to Yummy Food.', style: black15light),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Text(
                            'Register',
                            style: black40bold,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              log('help');
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text('Help',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent)),
                                SizedBox(width: 3),
                                Icon(Icons.help, color: Colors.blueAccent),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('Email:', style: black20),
                      ),
                      MyTextForm(
                        text: 'Email',
                        textInputType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('Phone Number:', style: black20),
                      ),
                      IntlPhoneField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          initialCountryCode: 'EG',
                          onChanged: (phone) {
                            registerNumber = phone.completeNumber;
                          }),
                      const Text('Password:', style: black20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: MyTextForm(
                          text: 'Password',
                          isPassword: isPassword,
                          textInputType: TextInputType.visiblePassword,
                          controller: passwordController,
                          suffix: Icons.remove_red_eye_outlined,
                          suffixPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: MyButton(
                            text: 'Register',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                CacheHelper.saveData(
                                    value: loginNumber, key: 'token');
                                navigateAndFinish(context, const HomePage());
                              }
                            }),
                      ),
                      const Center(child: Text('OR', style: black15light)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: MyButton(
                            color: Colors.white,
                            icon: true,
                            text: 'Sign in with Google',
                            textColor: Colors.blueAccent,
                            border: true,
                            onPressed: () {}),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Have an account?',
                            style: black20,
                          ),
                          MyTextButton(
                              onPressed: () {
                                if (widget.canBack) {
                                  navigateAndFinish(context, SignInScreen());
                                } else {
                                  navigateTo(context, SignInScreen());
                                }
                              },
                              text: 'Sign in here.')
                        ],
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              'By registering your account, you are agree to our',
                              style: black15light,
                            ),
                            MyTextButton(
                              onPressed: () {},
                              text: 'Terms and conditions.',
                              textSize: 15,
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
