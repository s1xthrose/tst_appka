
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

class SecondShoe extends StatelessWidget {
  SecondShoe({Key? key}) : super(key: key);

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
    imagePath: 'assets/shoecare/11.png',
    title: 'Как разносить тесные ботинки за полчаса',
    description:
    'Обувь настолько понравилась в магазине или не оставила равнодушной скидка на стоимость? Нога широкая, а модель симпатичная, но слишком узкая… Предпочли не обратить внимания на досадный факт, что пара немного жмет? Знакомая многим ситуация, когда думаешь: «Ничего, разносится как-нибудь». Как быть, если разносить тесную пару надо быстро и хочется избежать мучений от натертых мозолей в ожидании, пока новая обувь растянется естественным способом.',
    additionalInfo: [

        "Можно обратиться за помощью к обувному мастеру. В мастерских обычно есть специальные устройства для растяжки. А непосредственно в магазинах в продаже бывает пена для растяжения обуви. Более народный способ выглядит так:",

        "Смочить тесные туфли или ботинки изнутри водкой или спиртом Надеть на ноги с плотным носком Ходить по дому до полного высыхания тесной пары.",

        "Растянуть обувь из кожи на размер можно также с помощью обычного кипятка, для чего крутой кипяток заливается внутрь туфель и сразу же выливается обратно. Туфли разнашивают около 20 минут, пока остывающая кожа не примет форму по ноге.",

        "Этот способ применим и к кожзаменителю, но результата будет добиться сложнее. Можно не смазывать саму обувь изнутри, а толстые носки намочить любым одеколоном или спиртосодержащей жидкостью. Затем на носки надеть тугую пару и ходить так по квартире около 20 минут. При необходимости повторить процедуру, а резкий запах одеколона потом надо будет проветрить.",

        "Для растягивания замшевой обуви народные эксперты рекомендуют использовать пиво. Технология разнашивания такая же: следует хорошенько намочить пару изнутри пенным напитком, надеть ее на толстые носки, поносить некоторое время и оставить на проветривание.",

        "В вопросе растягивания обуви из натуральных материалов, особенно замши, важно не переусердствовать и не растянуть больше, чем надо. Поэтому действовать следует осторожно и постепенно. Замшевая обувь требует особой деликатности.",

        "Проще всего разносить текстильную обувь. Такую пару надо изнутри обильно ополоснуть горячей водой, надеть на носки и сушить прямо на ногах.",

        "В Сети советуют еще один способ с глицерином, который продается в любой аптеке и стоит недорого. Обувь надо обильно смочить этим средством, автор на видео ниже использовал такой метод для разноски берцев (высокие ботинки из толстой кожи). Правда этот способ займет больше времени. Пропитываться глицерином обувь надо оставить на несколько часов, после чего удалить салфеткой излишки аптечного средства. Обувь станет мягче и в использовании будет гораздо комфортнее.",

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
              // Display additional information
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