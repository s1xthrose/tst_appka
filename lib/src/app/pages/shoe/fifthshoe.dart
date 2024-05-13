import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shoecare.page.dart';
// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

class ShoeCareModel {
  final String imagePath;
  final String title;
  final String description;
  final List<String> additionalInfo;

  ShoeCareModel({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.additionalInfo,
  });
}

class FifthShoe extends StatelessWidget {
   FifthShoe({Key? key}) : super(key: key);

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle descriptionTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  final ShoeCareModel shoeCareModel = ShoeCareModel(
    imagePath: 'assets/shoecare/44.png',
    title: 'Дырка в подошве обуви: как правильно заклеить',
    description:
    'Подошва ботинок, кроссовок, модельных туфель и летних сандалий принимает на себя основную нагрузку, а потому со временем изнашивается, трескается и протекает. Отнести обувь в мастерскую – лучший выход из создавшегося положения: ремонт дома не принесет долговременного эффекта. Дырка в подошве обуви: как правильно заклеить в домашних условиях. Делимся советами.',
    additionalInfo: [
      'Прежде чем начать ремонтировать, обезжирьте поверхность. Бензин, ацетон или раствор для обезжиривания, берите то, что есть под рукой. Не забывайте о том, что обувь потом нужно еще раз просушить.',
      'Груз, который будете применять, подбирайте такой, чтобы не деформировал обувь.',
      'Клей нанесите на подошву и подождите пару минут. Кстати, насчет клея, берите качественный или специальный резиновый, или полиуретановый, или сапожный. Если ничего нет, возьмите классический «Момент».',
      'Работайте аккуратно: клей достаточно убрать. Помните, что все вещества токсичны, если попало в глаза или нос сразу промойте проточной водой.'
    ],
  );

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
                context, MaterialPageRoute(builder: (context) => ShoeCare()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                shoeCareModel.imagePath,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                shoeCareModel.title,
                style: titleTextStyle,
              ),
              SizedBox(height: 12),
              Text(
                shoeCareModel.description,
                style: descriptionTextStyle,
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: shoeCareModel.additionalInfo
                    .map((info) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    info,
                    style: descriptionTextStyle,
                  ),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}