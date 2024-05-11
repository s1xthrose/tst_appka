import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tst_appka/src/app/pages/materialmain.page.dart';
import 'package:tst_appka/src/app/pages/settings.page.dart';
import 'package:tst_appka/src/app/pages/shoecare.page.dart';
import 'package:tst_appka/src/app/pages/shoemain.page.dart';
import 'aboutshoe.page.dart';
import 'aboutwork.page.dart';
import 'addshoe.page.dart';
import 'addwork.page.dart';
import 'home.page.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

final PageController _pageController = PageController(initialPage: 0);

class ShoeMainPage extends StatelessWidget {
  const ShoeMainPage({Key? key}) : super(key: key);

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
                "Обувь",
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ShoeCare()));
                  },
                  icon: Icon(Icons.event_note, color: _whiteColor),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(
                        builder: (context) => SettingsPage()));
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 14,left: 20,right: 20),
        child: FutureBuilder(
          future: Hive.openBox<ShoeModel>('Shoes'), // Имя коробки здесь 'shoe'
          builder: (BuildContext context, AsyncSnapshot<Box<ShoeModel>> snapshot) {
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
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two columns
                    crossAxisSpacing: 10.0, // Spacing between columns
                    mainAxisSpacing: 10.0, // Spacing between rows
                  ),
                  itemCount: box!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ShoeModel shoe = box.getAt(index)!;
                    return ShoeCard(shoe: shoe); // Используйте ShoeCard
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
        child: AddShoeButton(),
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
                    MaterialPageRoute(builder: (context) => MaterialMainPage()));
              },
              label: "Материалы",
            ),
            CustomMaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              label: "Работы",
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

class AddShoeButton extends StatelessWidget {
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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddNewShoe()));
        },
        icon: Icon(Icons.add, size: 20, color: _whiteColor),
        label: Text(
          "Добавить обувь",
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


class ShoeCard extends StatelessWidget {
  final ShoeModel shoe;

  const ShoeCard({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShoeDetailsPage(shoe: shoe),
          ),
        );
      },
      child: Card(
        color: Colors.white, // Изменено на белый цвет
        elevation: 0, // Убрана тень Card, так как мы добавим тень вручную
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: Container(
          height: 220.h, // Set card height here
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
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 3.0, // Maintain aspect ratio
                  child: ClipRRect(
                    child: shoe.imagePath != null &&
                        File(shoe.imagePath!).existsSync()
                        ? Container(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20),// Add padding here
                      child: Image.file(
                        // Display image if imagePath is not null and file exists
                        File(shoe.imagePath!),
                        fit: BoxFit.cover,
                        // Ensure the image fills the entire container
                        //alignment: Alignment.center,
                        // Align the image to the center
                        width: 130.w,
                        height: 130.h,
                      ),
                    )

                        : Container(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20),
                      child: Image.asset(
                        // Display placeholder image if imagePath is null or file doesn't exist
                        'assets/addshoe/icon_placeholder.png',
                        fit: BoxFit.cover,
                        // Ensure the image fills the entire container
                        //alignment: Alignment.center,
                        // Align the image to the center
                        width: 130.w,
                        height: 130.h,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 20, left: 0, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      shoe.mark,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
