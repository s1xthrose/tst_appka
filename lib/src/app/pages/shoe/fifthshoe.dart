import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shoecare.page.dart';


// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

class FifthShoe extends StatelessWidget {
  const FifthShoe({Key? key}) : super(key: key);

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
                'assets/shoecare/44.png', // Путь к вашему изображению
                fit: BoxFit.cover, // Растягиваем изображение на всю доступную область
              ),
              SizedBox(height: 20),
              Text(
                "Дырка в подошве обуви: как правильно заклеить",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Подошва ботинок, кроссовок, модельных туфель и летних сандалий принимает на себя основную нагрузку, а потому со временем изнашивается, трескается и протекает. Отнести обувь в мастерскую – лучший выход из создавшегося положения: ремонт дома не принесет долговременного эффекта. Дырка в подошве обуви: как правильно заклеить в домашних условиях. Делимся советами.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Сначала общие рекомендации.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "1. Прежде чем начать ремонтировать, обезжирьте поверхность. Бензин, ацетон или раствор для обезжиривания, берите то, что есть под рукой. Не забывайте о том, что обувь потом нужно еще раз просушить. 2. Груз, который будете применять, подбирайте такой, чтобы не деформировал обувь. 3. Клей нанесите на подошву и подождите пару минут. Кстати, насчет клея, берите качественный или специальный резиновый, или полиуретановый, или сапожный. Если ничего нет, возьмите классический «Момент». 4. Работайте аккуратно: клей достаточно убрать. Помните, что все вещества токсичны, если попало в глаза или нос сразу промойте проточной водой.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Есть несколько способов ремонта подошвы, разберем подробно каждый.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "1. Подошва расклеилась по краю. Вымойте подошву, высушите, обезжирьте. Нанесите клей, подождите несколько минут и затем придавите грузом. 2. Трещину в подошве заклеить сложнее. Сначала очистить и обезжирить саму трещину, затем подготовить заплатку. Ее можно вырезать из велосипедной камеры. Заплатку тоже нужно зачистить и обезжирить. Затем подошву согнуть таким образом, чтобы трещина раскрылась и вставить во внутрь приготовленный кусочек. Разогните подошву и положите под груз обувь. Какое-то время подошва промокать не будет. 3. Отремонтировать дырявую подошву поможет силиконовый клей-герметик. С внутренней стороны обуви вынимаем стельку и заполняем дырку клеем. Потом кладем под груз настолько, как написано в инструкции.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Если прохудилась подошва демисезонной обуви, ремонт займет более длительное время. Все дело в структуре подошвы. Для осенней, весенней и зимней обуви характерна структура напоминающая соты или решетку.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "1. Сначала снимаем стельку. Очищаем и обезжириваем все отверстия. 2. Заполняем каждое герметиком. 3. Новые стельки промажьте им же, придавите грузом на время, указанное в инструкции.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Летняя обувь, как правило, на ровной подошве, поэтому и ремонт простой и не требует особых усилий.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "1. Купите новую резиновую подошву. 2. Вырежьте шаблон из хлопчатобумажной ткани по размеру и приварите его утюгом к подошве. 3. Приклейте новую подошву, придавите грузом.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Спортивная обувь имеет особую форму подошвы: она немного заходит на носок.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "1. Когда подошва стирается именно в этом месте, то сначала нужно зачистить это место наждачной бумагой и обезжирить. 2. Затем вырезаем заплатку. Важно, чтобы материал был разной толщины: более тонкий приклеиваем к подошве, а толстый – к носку. 3. Заплатку также обрабатываем наждачкой, смазываем клеем и прижимаем. 4. Держать под грузом нужно не менее 24 часов.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Домашний ремонт поможет продержаться подошве какое-то время, но не затягивайте с ремонтом в мастерской.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}