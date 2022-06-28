import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/cache_helper.dart';
import '../../core/constants.dart';
import '../../core/functions.dart';
import '../../reusable_components/my_button.dart';
import '../../reusable_components/my_text_button.dart';
import '../register_screen.dart';
import '../sign_in_screen.dart';
import 'boarding_item.dart';
import 'boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  var boardController = PageController();

  void submit({
    required Widget screen,
  }) {
    CacheHelper.saveData(key: 'onBoardingDone', value: true).then((value) {
      navigateAndFinish(context, screen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: '7',
                            style: TextStyle(
                              color: handColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: 'Krave',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                      ])),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height / 1.7
                          : 300,
                      child: PageView.builder(
                        controller: boardController,
                        onPageChanged: (int index) {
                          if (index == boarding.length - 1) {
                            setState(() {
                              isLast = true;
                            });
                          } else {
                            isLast = false;
                          }
                        },
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            BoardingItem(model: boarding[index]),
                        itemCount: boarding.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                      child: SmoothPageIndicator(
                        effect: CustomizableEffect(
                          spacing: 5,
                          activeDotDecoration: DotDecoration(
                              color: handColor,
                              width: 20,
                              height: 8,
                              borderRadius: BorderRadius.circular(10)),
                          dotDecoration: DotDecoration(
                              color: Colors.grey.shade400,
                              width: 20,
                              height: 8,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: boardController,
                        count: boarding.length,
                      ),
                    ),
                    MyButton(
                      text: 'Get Started',
                      onPressed: () {
                        if (isLast) {
                          submit(screen: SignInScreen());
                        } else {
                          boardController.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: black20,
                        ),
                        MyTextButton(
                            onPressed: () {
                              if (isLast) {
                                submit(
                                    screen:
                                        const RegisterScreen(canBack: false));
                              } else {
                                boardController.nextPage(
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              }
                            },
                            text: 'Sign Up')
                      ],
                    )
                  ],
                ),
              ),
              MyButton(
                color: Colors.grey.shade200,
                text: 'Skip',
                textSize: 15,
                textColor: Colors.black,
                infinity: false,
                onPressed: () {
                  submit(screen: SignInScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
