import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tst_appka/src/app/pages/addmaterial.page.dart';
import 'package:tst_appka/src/app/pages/settings.page.dart';
import 'package:tst_appka/src/app/pages/shoecare.page.dart';
import 'package:tst_appka/src/app/pages/shoemain.page.dart';
import 'aboutshoe.page.dart';
import 'aboutwork.page.dart';
import 'addshoe.page.dart';
import 'addwork.page.dart';
import 'home.page.dart';
import 'materialdetails.page.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;
String searchText = '';
final PageController _pageController = PageController(initialPage: 2);
final TextEditingController FindController = TextEditingController();
class MaterialMainPage extends StatefulWidget {
  const MaterialMainPage({Key? key}) : super(key: key);

  @override
  _MaterialMainPageState createState() => _MaterialMainPageState();
}

class _MaterialMainPageState extends State<MaterialMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable the back arrow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        backgroundColor: _primaryColor,
        toolbarHeight: 92, // Set toolbar height here
        centerTitle: true, // Center the title text
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), // Add horizontal padding here
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Материалы",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: _whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), // Add horizontal padding here
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShoeCare()));
                  },
                  icon: Icon(Icons.event_note, color: _whiteColor),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                  },
                  icon: Icon(Icons.settings, color: _whiteColor),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), // Add horizontal padding here
            child: PageControlsIndicator(_pageController), // Pass the _pageController
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 20, right: 20, top: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(0, 0, 0, 0.05),
              ),
              child: TextField(
                controller: FindController,
                onChanged: (value) {
                  // Обновите переменную searchText при изменении текста в поле поиска
                  setState(() {
                    searchText = value;
                  });
                },
                onTap: () {
                  if (FindController.text == 'Поиск') {
                    FindController.clear();
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromRGBO(0, 0, 0, 0.01),
                ),
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                cursorHeight: 16,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80, left: 20, right: 20),
              child: FutureBuilder(
                future: Hive.openBox<MaterialModel>('Mater'),
                builder: (BuildContext context, AsyncSnapshot<Box<MaterialModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Ошибка загрузки данных'),
                      );
                    } else {
                      final box = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: box!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final MaterialModel mat = box.getAt(index)!;
                          // Фильтрация материалов по названию на основе введенного текста
                          if (mat.name.toLowerCase().contains(searchText.toLowerCase())) {
                            return MaterialCard(mat: mat);
                          } else {
                            return SizedBox(); // Возврат пустого контейнера, если элемент не соответствует поиску
                          }
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: _whiteColor,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: AddMaterialButton(),
      ),
    );
  }
}

class PageControlsIndicator extends StatelessWidget {
  final PageController pageController;

  PageControlsIndicator(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShoeButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              label: "Работы",
            ),
            CustomMaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoeMainPage()),
                );
              },
              label: "Обувь",
            ),
          ],
        ),
        Positioned(
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            onDotClicked: (index) => pageController.animateToPage(index,
                duration: const Duration(milliseconds: 250), curve: Curves.easeIn),
            effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class ShoeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const ShoeButton({
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 8)),
      ),
      onPressed: onPressed,
      icon: Icon(Icons.chevron_left, size: 28, color: _whiteColor),
      label: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: _whiteColor,
        ),
      ),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CustomMaterialButton({
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 8)),
      ),
      onPressed: onPressed,
      icon: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: _whiteColor,
        ),
      ),
      label: Icon(Icons.chevron_right, size: 28, color: _whiteColor),
    );
  }
}

class AddMaterialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _primaryColor,
      ),
      width: MediaQuery.of(context).size.width * _buttonWidth,
      height: _buttonHeight,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_primaryColor),
        ),
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("onboarding", true);

          if (!context.mounted) return;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddNewMaterial()));
        },
        icon: Icon(Icons.add, size: 20, color: _whiteColor),
        label: Text(
          "Добавить материал",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _whiteColor,
          ),
        ),
      ),
    );
  }
}


class MaterialCard extends StatelessWidget {
  final MaterialModel mat;

  const MaterialCard({Key? key, required this.mat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialDetailsPage(mat: mat),),);
      },
      child: Card(
        color: Colors.white, // Changed to white color
        elevation: 0, // Removed Card shadow
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: Container(
          height: 100, // Fixed height to 80
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(5, 5),
                blurRadius: 35,
                spreadRadius: -15,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ClipRRect(
                  child: SizedBox(
                    width: 80.w, // Set width to 80
                    height: 60.h, // Set height to 60
                    child: mat.imagePath != null &&
                        File(mat.imagePath!).existsSync()
                        ? Image.file(
                      File(mat.imagePath!),
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      'assets/addshoe/icon_placeholder.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mat.name,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        mat.comment,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align( // Align mat.count to the right
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, bottom: 0), // Add right padding here
                  child: Text(
                    mat.count + "шт.",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
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
