import 'package:flutter/material.dart';
import '../core/cache_helper.dart';
import '../core/functions.dart';
import 'on_boarding/on_boarding_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), actions: [
        IconButton(
          onPressed: () {
            CacheHelper.clearData();
            navigateTo(context, const OnBoardingScreen());
          },
          icon: const Icon(Icons.logout),
          tooltip: 'logout & clear data',
        )
      ]),
      body: const Center(child: Text('Home Page')),
    );
  }
}
