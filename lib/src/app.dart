import 'package:flutter/material.dart';

import 'app/pages/onboarding.page.dart';
import 'app/pages/splash.page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      routes: {
        '/on_boarding': (context) =>  OnboardingView(),
      },
    );
  }
}