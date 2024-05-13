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

class FirstShoe extends StatelessWidget {
  FirstShoe({Key? key}) : super(key: key);

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
    imagePath: 'assets/shoecare/shoe.png',
    title: 'Как ухаживать за обувью: самое важное',
    description:
    'Потратив время, силы и деньги на покупку обуви, не хочется прощаться с ней после первого дождя или прогулки по реагентам. Перед наступлением осени вспоминаем несложные правила для долгой и счастливой жизни обуви.',
    additionalInfo: [

        "1. Чистка",

        "Ежедневно чистите обувь щеткой, салфеткой из микрофибры, при необходимости — со средством, подходящим по типу материала, или влажными салфетками (последние особенно удобны в дороге). Старайтесь каждый день доставать съемные стельки, раз в неделю мыть их. Саму обувь лучше не мыть водой. Кожа грубеет, нубук становится похож на наждак, а что происходит с замшей, даже представить страшно. Если вы не готовы возиться самостоятельно, несите в специализированную чистку.",

        "2. Нанесение крема",

        "Первое, что нужно сделать, — определиться с типом материала. Второе и последнее — найти название материала на упаковке средства и следовать инструкции. При прочих равных отдавайте предпочтение специализированным, а не универсальным средствам, расспрашивайте продавцов, читайте рекомендации на сайте производителя обуви. Большой выбор средств для восстановления и окраски разных типов кожи и других материалов есть у Saphir, Tarrago, Collonil, Salamander. Они продаются более или менее везде, проблем с приобретением не возникнет, даже если вы захотите не просто закрасить потертости, но и добавить красок в жизнь ваших кроссовок. У многих марок есть свои собственные средства ухода (например, Timberland, Dr. Martens, Santoni, New Balance). Использовать именно их, конечно, не обязательно, но так меньше шансов ошибиться. Даже если вы не получили консультацию в магазине, можно написать в службу поддержки, указать номер вашей модели и попросить подобрать уход. В сети Rendez-Vous проводят мастер-классы по уходу за обувью, причем средства и приемы ухода демонстрируют именной на вашей паре.",

        "3. Полировка",

        "Следующий этап — полировка мягкой щеткой или салфеткой из хлопка, искусственного материала (например, флиса), кожи, шерсти или меха. Салфетки вполне можно изготовить и самостоятельно, купив отрез в магазине тканей или дав вторую жизнь сестре утерянной варежки.",

        "4. Защита",

        "Нанесение водоотталкивающего средства. Оно защитит обувь от дождя, пролитых на нее напитков, пыли, дорожной грязи. Обязательно для моделей из замши, но и всем остальным не повредит.",

        "5. Комфорт",

        "Обувь, которую вы часто и подолгу носите, время от времени необходимо обрабатывать дезодорантом и сушить. Мастера по ремонту обуви обычно не рекомендуют использовать электрические сушилки (но и не все говорят им категоричное нет!). Альтернатива — пакетики с силикагелем или бумага.",

        "6. Хранение",

        "Прежде чем убрать сезонную обувь на долгое хранение, набейте ее бумагой или вставьте колодки. Это особенно важно для обуви из лаковой и металлизированной кожи, так как на ней быстрее образуются заломы. В принципе, никто не запрещает проделывать это каждый раз, когда вы снимаете обувь и ставите ее на полку на пару дней — именно столько рекомендуют давать отдыхать обуви мастера и производители.",

        "7. Вовремя относите обувь в ремонт",

        "Поменять набойку быстрее и дешевле, чем поменять набойку и восстановить каблук, это понятно каждому. Но когда обувь вычищена и подготовлена для транспортировки в мастерскую, внезапно именно эта пара оказывается нужна. Если замечали за собой такое, пользуйтесь услугами мастерских, которые принимают обувь без подготовки и присылают курьеров.",

        "Что делать с кроссовками",

        "Отдельно хочется сказать о кроссовках. Споры о том, можно стирать их в машинке или нет, ведутся очень давно. На одну рекомендацию, допускающую этот способ очистки для моделей, у которых нет замшевых и кожаных деталей, найдется другая, запрещающая это делать. Главный аргумент против — преждевременный износ и деформация обуви в процессе стирки и отжима плюс температурное воздействие, которое может привести к растапливанию и миграции клея. Теоретически все это можно обойти, используя режим деликатной стирки, отключив отжим и сушку. Но поскольку машинная стирка противоречит большинству рекомендаций производителей, делать это можно только в том случае, если вам не чужд риск.",

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