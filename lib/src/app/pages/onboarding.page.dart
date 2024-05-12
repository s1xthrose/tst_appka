import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tst_appka/src/app/pages/home.page.dart';

// onboarding_view.dart
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _controller = OnboardingItems();
  final _pageController = PageController();

  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomSheet: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: _isLastPage
            ? GetStartedButton(context)
            : ContinueButton(onPressed:
         () => _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: PageView.builder(
          onPageChanged: (index) => setState(() => _isLastPage = _controller.items.length - 1 == index),
          itemCount: _controller.items.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(_controller.items[index].image),
                const SizedBox(height: 12),
                Text(
                  _controller.items[index].title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _controller.items.length,
                  onDotClicked: (index) => _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 250), curve: Curves.easeIn),
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Color.fromRGBO(88, 86, 214, 1),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// get_started_button.dart
class GetStartedButton extends StatelessWidget {
  final BuildContext _context;

  GetStartedButton(this._context);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(88, 86, 214, 1),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: TextButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("onboarding", true);

          if (!_context.mounted) return;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Text(
          "Начать",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}

// continue_button.dart
class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  ContinueButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(88, 86, 214, 1),
      ),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.9,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          "Продолжить",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}



class OnboardingItems{
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Храните информацию о материалах",
        image: "assets/onboarding/icon_2.png"),

    OnboardingInfo(
        title: "Структурируйте информацию об обуви и её владельце",
        image: "assets/onboarding/icon_3.png"),

    OnboardingInfo(
        title: "Держите под контролем количество рабочих задач",
        image: "assets/onboarding/icon_4.png"),
  ];
}

class OnboardingInfo{
  final String title;
  final String image;

  OnboardingInfo({required this.title, required this.image});
}
