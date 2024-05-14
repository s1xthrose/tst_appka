import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tst_appka/src/app/pages/materialmain.page.dart';
import 'package:tst_appka/src/app/pages/settings.page.dart';
import 'package:tst_appka/src/app/pages/shoecare.page.dart';
import 'package:tst_appka/src/app/pages/shoemain.page.dart';
import 'aboutwork.page.dart';
import 'addshoe.page.dart';
import 'addwork.page.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

final PageController _pageController = PageController(initialPage: 1);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        backgroundColor: _primaryColor,
        toolbarHeight: 92,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Работы",
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
            padding: EdgeInsets.symmetric(horizontal: 10),
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: PageControlsIndicator(_pageController),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top:14, bottom: 80),
        child: FutureBuilder(
          future: Hive.openBox<WorkModel>('works'),
          builder: (BuildContext context, AsyncSnapshot<Box<WorkModel>> snapshot) {
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
                    final WorkModel work = box.getAt(index)!;
                    return WorkCard(work: work);
                  },
                );
              }
            }
          },
        ),
      ),
      bottomSheet: Container(
        color: _whiteColor,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: AddWorkButton(),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoeMainPage()),
                );
              },
              label: "Обувь",
            ),
            CustomMaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MaterialMainPage()));
              },
              label: "Материалы",
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

class AddWorkButton extends StatelessWidget {
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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddWrk()));
        },
        icon: Icon(Icons.add, size: 20, color: _whiteColor),
        label: Text(
          "Добавить работу",
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

class WorkCard extends StatelessWidget {
  final WorkModel work;

  const WorkCard({
    required this.work,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Получаем объект shoe из базы данных Hive
        final shoeBox = await Hive.openBox<ShoeModel>('Shoes');
        final shoe = shoeBox.getAt(0);

        if (shoe != null) {
          // Объект shoe получен успешно, переходим на страницу WorkDetailsPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkDetailsPage(work: work, shoe: shoe),
            ),
          );
        } else {
          // Обработка случая, когда объект shoe не найден
          print('Объект shoe не найден в базе данных Hive.');
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
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
        child: Stack(
          children: [
            ListTile(
              title: Text(
                work.name,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                work.shoe,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 10,
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.chevron_right,
                  size: 28,
                  color: Colors.black,
                ),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
      ),
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
