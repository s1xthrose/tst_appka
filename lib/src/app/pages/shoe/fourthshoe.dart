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

class FourthShoe extends StatelessWidget {
  FourthShoe({Key? key}) : super(key: key);

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
    imagePath: 'assets/shoecare/33.png',
    title: 'Как избавиться от соли на обуви: 8 проверенных способов',
    description:
    '"В холодное время года многие сталкиваются с тем, что на зимних сапогах и ботинках появляются неприятные разводы. После этого встает вопрос, как избавиться от соли на обуви. Сделать это несложно — делимся секретами.',
    additionalInfo: [

        "Зимние реагенты на дорогах и тротуарах являются не только помощниками, позволяющими избежать травм при падениях, но и вредят обуви. Избежать попадания этих средств на кожу или замшу практически невозможно. К тому же соль на поверхности обуви может появляться и по другим причинам. Однако этого вовсе не повод расстраиваться и отправлять на выброс любимую пару. Рассказываем, как избавиться от соли на обуви несколькими разными способами.",

        "Причины появления следов соли на обуви",

        "Такая проблема как пятна соли на обуви может возникать по разным причинам. Она поражает буквально все материалы: как натуральные кожу, замшу и нубук, так и их заменители. Основных причин, по которым портятся ботинки или сапоги, немного:",

        "Высыхание промокшей обуви из натуральной кожи (сам материал при намокании выделяет соль) Попадание на обувь реагентов, которыми посыпают дороги Попадание соли из почвы, которая попадает в лужи при таянии снега.",

        "Как убрать соль на замшевой или кожаной обуви",

        "Разные материалы в разной степени поддаются очистке. Проще всего избавиться от соляных разводов на кожаной обуви. Однако и замше можно придать приличный внешний вид.",

        "С помощью народных средств",

        "Если проблема кажется вам разовой, вовсе необязательно покупать дорогостоящие специальные средства для очистки обуви. Справиться с ней помогут подручные средства, которые точно найдутся у вас дома.",

        "1. Раствор уксуса",

        "Для гладкой обуви, сделанной из натуральной кожи или хорошего искусственного ее аналога, подойдет способ очистки с использованием обычного столового уксуса концентрацией 9%. ",

        "Его следует развести водой в пропорции 1:2 (на одну часть уксуса добавьте две части воды). Полученную смесь стоит нанести на салфетку или чистую тряпочку, а затем протереть ею пораженные участки. Не забудьте заранее смахнуть с пары сухую грязь и песок.",

        "После обработки уксусом пару нужно тщательно высушить. Для этого внутрь каждого сапога или ботинка поместите бумагу или ветошь, чтобы сохранить форму. После высыхания обработайте кожаную поверхность влагоотталкивающими средствами.",

        "2. Сода, разведенная в молоке",

        "Не хуже, чем кислота в уксусе, для очистки обуви работают щелочные средства. Вам потребуется пищевая сода, которую будет нужно развести в небольшом количестве молока (желательно обезжиренного). Кстати, этот способ идеально подойдет для пары, изготовленной из натуральной замши или нубука.",

        "Перед очисткой обувь следует тщательно просушить, не допуская сильного нагрева и поместив внутрь бумагу. На помощь могут прийти специальные электросушилки. После тщательно промойте подошву и кант изделий, не допуская попадания воды непосредственно на саму замшу.",

        "Смешайте молоко и соду в равных пропорциях. Достаточно будет взять 1 чайную ложку порошка и 1 чайную ложку жидкости. Для лучшего эффекта в смесь можно добавить несколько капель нашатырного спирта. Нанесите смесь на ватный диск и аккуратно обработайте пятна от соли. Затем очистите поверхность другим ватным диском, смоченным в воде. После всех манипуляций щеточкой восстановите структуру ворса. В идеале следует еще обработать пару специальным защитным средством, предназначенным для замши и нубука.",

        "3. Нашатырный  спирт",

        "Такое средство как нашатырный спирт вполне можно назвать универсальным: он подходит для очистки как кожаной, так и замшевой обуви. Однако способ его применения будет немного отличаться.",

        "Если вы решили почистить нашатырным спиртом кожаную пару, алгоритм действий будет таким же, как и при использовании уксусного раствора. Не забудьте заранее промыть обувь от загрязнений и тщательно высушить. Если сапоги или ботинки не успели хорошенько просохнуть, применение чистящих средств не только не будет эффективным, но и навредит.",

        "На замшу средство стоит наносить очень аккуратно, чтобы не повредить бархатистую структуру материала. А чтобы убрать его с поверхности материала и при этом сохранить привлекательный внешний вид сапожек, место, где были пятна, можно посыпать манной крупой. Она впитает в себя излишки жидкости.",

        "4. Зубной порошок",

        "В современном мире зубной порошок можно назвать редкостью. Тем не менее если он найдется у вас дома, его можно применить для очистки обуви. Правда, только той, что сделана из замши.",

        "Тонким слоем покройте зубным порошком места, на которых проступают соляные разводы. Далее возьмите щеточку с мягким ворсом и аккуратно почистите обувь. Излишки порошка можно убрать с материала едва влажным ватным диском.",

        "5. Касторовое масло с рыбьим жиром",

        "Для кожаной обуви идеальным средством станет касторовое масло. В сочетании с обыкновенным рыбьим жиром оно поможет избавиться даже от самых сильных загрязнений. Эту смесь необходимо смешать в соотношении 1:3, а также нагреть на водяной бане, перемешивая, чтобы добиться однородности.",

        "Очистите обувь от видимых загрязнений и тщательно высушите. После этого смажьте сапоги или ботинки смесью касторового масла и рыбьего жира, уделяя особое внимание местам, где видны белые разводы от соли. Спустя время пятна полностью исчезнут, а пара порадует вас сияющим внешним видом.",

        "6. Картофельный сок",

        "Для очистки замшевой обуви, если разводов на ней еще совсем немного, можно применить сок картофеля. Использовать его невероятно просто: разрежьте сырую картофелину и тщательно натрите ее половинками места, на которых проступили разводы. После чего дайте картофельному соку полностью высохнуть и аккуратно удалите его с поверхности при помощи специальной мягкой щеточки.",

        "7. С помощью специальных средств",

        "В магазинах можно найти немало специализированных средств, которые вернут вашим ботинкам или сапогам практически первозданный вид. Выбирая средство, обратите внимание на указания на упаковке. На этикетке обязательно должно быть указано, для какого материала подходит данная косметика, а также то, от каких именно загрязнений она избавляет. А для получения наилучшего результата стоит в точности следовать инструкции по применению.",

        "8. Обратиться в ремонт обуви",

        "Самым простым способом станет обращение в мастерскую по ремонту обуви. Профессионалы легко и быстро приведут ботинки или сапоги в порядок, используя при этом качественные средства, не всегда доступные в обычных магазинах. А если обувь подверглась сильному воздействию соли, мастер отреставрирует материал и сделает его более износостойким. Тем не менее этот вариант очистки будет и самым дорогим.",

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