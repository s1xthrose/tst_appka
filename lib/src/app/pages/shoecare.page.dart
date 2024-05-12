import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_appka/src/app/pages/shoe/firstshoe.dart';
import 'package:tst_appka/src/app/pages/shoe/fourthshoe.dart';
import 'package:tst_appka/src/app/pages/shoe/secondshoe.dart';
import 'package:url_launcher/url_launcher.dart';

import 'shoe/fifthshoe.dart';
import 'shoe/thirdshoe.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);

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
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Добавляем карточки с использованием данных из модели
              for (var i = 0; i < shoeCareModels.length; i++)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => shoeCareModels[i].page),
                        );
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
                                  shoeCareModels[i].imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                shoeCareModels[i].title,
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
                    SizedBox(height: i == shoeCareModels.length - 1 ? 0 : 12), // Вертикальный отступ между карточками
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Класс для хранения данных карточек и страниц, на которые они должны переходить
class CardModel {
  final String imagePath;
  final String title;
  final Widget page;

  CardModel({
    required this.imagePath,
    required this.title,
    required this.page,
  });
}

// Модели карточек и связанных с ними страниц
final List<CardModel> shoeCareModels = [
  CardModel(
    imagePath: 'assets/shoecare/shoe.png',
    title: 'Как ухаживать за обувью: самое важное',
    page: FirstShoe(),
  ),
  CardModel(
    imagePath: 'assets/shoecare/11.png',
    title: 'Как разносить тесные ботинки за полчаса',
    page: SecondShoe(),
  ),
  CardModel(
    imagePath: 'assets/shoecare/22.png',
    title: 'Как убрать царапины с кожаной обуви',
    page: ThirdShoe(),
  ),
  CardModel(
    imagePath: 'assets/shoecare/33.png',
    title: 'Как избавиться от соли на обуви: 8 проверенных способов',
    page: FourthShoe(),
  ),
  CardModel(
    imagePath: 'assets/shoecare/44.png',
    title: 'Дырка в подошве обуви: как правильно заклеить',
    page: FifthShoe(),
  ),
];
