import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../core/cache_helper.dart';
import '../core/constants.dart';
import '../core/functions.dart';
import '../reusable_components/my_button.dart';
import '../reusable_components/my_text_button.dart';
import 'home_page.dart';
import 'register_screen.dart';

String loginNumber = '';

class SignInScreen extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: const AssetImage('assets/images/back.png'),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome to Yummy Food.', style: black15light),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          'Sign in',
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
                                      fontSize: 18, color: Colors.blueAccent)),
                              SizedBox(width: 3),
                              Icon(Icons.help, color: Colors.blueAccent),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text('Phone Number:', style: black20),
                    ),
                    IntlPhoneField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        initialCountryCode: 'EG',
                        onChanged: (phone) {
                          loginNumber = phone.completeNumber;
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: MyButton(
                          text: 'Sign in',
                          onPressed: () {
                            if (phoneNumberController.text != '') {
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
                          'Don\'t have an account?',
                          style: black20,
                        ),
                        MyTextButton(
                            onPressed: () {
                              navigateTo(
                                  context, const RegisterScreen(canBack: true));
                            },
                            text: 'Sign Up')
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        'Use the application according to policy rules, Any kind of violations will be subject to sanctions.',
                        textAlign: TextAlign.center,
                        style: black15light,
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
