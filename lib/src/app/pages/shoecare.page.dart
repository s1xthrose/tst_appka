import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_appka/src/app/pages/shoe/firstshoe.dart';
import 'package:tst_appka/src/app/pages/shoe/fourthshoe.dart';
import 'package:tst_appka/src/app/pages/shoe/secondshoe.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.page.dart';
import 'shoe/fifthshoe.dart';
import 'shoe/thirdshoe.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

class ShoeCare extends StatelessWidget {
  const ShoeCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _whiteColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        backgroundColor: _primaryColor,
        title: Text(
          "Об уходе за обувью",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: _whiteColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 28, color: _whiteColor),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => FirstShoe()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 0.25),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/shoecare/shoe.png', // Путь к вашему изображению
                          fit: BoxFit.cover, // Растягиваем изображение на всю доступную область
                        ),
                      ),
                      Text(
                        "Как ухаживать за обувью: самое важное",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SecondShoe()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 0.25),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/shoecare/11.png', // Путь к вашему изображению
                          fit: BoxFit.cover, // Растягиваем изображение на всю доступную область
                        ),
                      ),
                      Text(
                        "Как разносить тесные ботинки за полчаса",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => ThirdShoe()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 0.25),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/shoecare/22.png', // Путь к вашему изображению
                          fit: BoxFit.cover, // Растягиваем изображение на всю доступную область
                        ),
                      ),
                      Text(
                        "Как убрать царапины с кожаной обуви",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => FourthShoe()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 0.25),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/shoecare/33.png', // Путь к вашему изображению
                          fit: BoxFit.cover, // Растягиваем изображение на всю доступную область
                        ),
                      ),
                      Text(
                        "Как избавиться от соли на обуви: 8 проверенных способов",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => FifthShoe()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 0.25),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/shoecare/44.png', // Путь к вашему изображению
                          fit: BoxFit.cover, // Растягиваем изображение на всю доступную область
                        ),
                      ),
                      Text(
                        "Дырка в подошве обуви: как правильно заклеить",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

launchUrl(Uri url) async {
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  } else {
    throw 'Could not launch $url';
  }
}


