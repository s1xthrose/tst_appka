import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkFirstRun();
  }
  _checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

    if (isFirstRun) {
      prefs.setBool('isFirstRun', false);
      Timer(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacementNamed('/on_boarding');
      });
    } else {
      Timer(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacementNamed('/on_boarding');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(393, 852));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/splash/icon_1.svg',
              width: ScreenUtil().setWidth(271),
              height: ScreenUtil().setHeight(293),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Легкий учёт обувной мастерской',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
