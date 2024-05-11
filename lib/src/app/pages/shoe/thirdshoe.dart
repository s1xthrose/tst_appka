import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shoecare.page.dart';


// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

class ThirdShoe extends StatelessWidget {
  const ThirdShoe({Key? key}) : super(key: key);

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
                'assets/shoecare/22.png', // Путь к вашему изображению
                fit: BoxFit.cover, // Растягиваем изображение на всю доступную область
              ),
              SizedBox(height: 20),
              Text(
                "Как убрать царапины с кожаной обуви",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Очень часто на кожаной обуви, а также на изделиях из натуральной кожи, появляются царапины, которые трудно замаскировать с помощью крема. Это конечно огорчает, но выбрасывать изделие не надо, сапожник рассказал как можно быстро избавиться от царапин.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Он рассказал как с помощью жидкой кожи это сделать. Надо нанести тонкий слой этой жидкой кожи и дать просохнуть, причем эту процедуру можно проделывать неоднократно.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Как это сделать",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Нам надо иметь кусочек кожи, я думаю вы найдете способ как его раздобыть и откуда.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Можно со старой вещи, которую уже не носите, а можно выбрать место на сумке, куртке или обуви, где срезать маленький кусочек и это не будет видно, например на внутренней стороне.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Когда кусочек найден, приступим к изготовлению жидкой кожи. Берем пипетку и набираем в нее ацетон или жидкость для снятия лака, капаем из пипетки на кожу и аккуратно соскабливаем материал.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Если вы сделаете это аккуратно, то царапину вообще не будет видно, повреждения как не бывало.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Для этого надо воспользоваться бинтом и когда вы нанесете жидкую кожу на обувь, то бинтом надо плотно прижать, а сверху нанести еще один слой, аккуратно все разровнять и оставить, чтобы высохло.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Схватится примерно через полчаса, а носить обувь можно через день после процедуры. Когда все высохнет, вы увидите прекрасный результат, который с помощью крема достичь невозможно.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "И еще один совет от сапожника, если обувь сильно повреждена",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Если на обуви большие царапины или потертости, то можно воспользоваться воском. Есть специальный воск, но если вы его не имеете, то сойдет и пчелиный и из восковой свечи.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Воск разогреваем и льем на нужное место. А если обувь не черная, то надо сразу же закрасить царапину с помощью маркера или цветного крема для обуви, да и черную тоже можно подкрасить.",
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