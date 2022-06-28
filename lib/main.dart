import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/cache_helper.dart';
import 'screens/home_page.dart';
import 'screens/on_boarding/on_boarding_screen.dart';
import 'screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  bool? onBoardingDone = CacheHelper.getBoolean(key: 'onBoardingDone');
  String? token = CacheHelper.getString(key: 'token');
  Widget startWidget;

  if (onBoardingDone == true) {
    if (token == null) {
      startWidget = SignInScreen();
    } else {
      startWidget = const HomePage();
    }
  } else {
    startWidget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({Key? key, this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 400,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      title: 'Task 1',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: startWidget,
    );
  }
}
