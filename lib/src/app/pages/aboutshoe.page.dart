import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:intl/intl.dart';
import 'package:tst_appka/src/app/pages/shoemain.page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'addshoe.page.dart';
import 'addwork.page.dart';
import 'editshoe.page.dart';


// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;



class ShoeDetailsPage extends StatelessWidget {
  final ShoeModel shoe;

  const ShoeDetailsPage({Key? key, required this.shoe}) : super(key: key);

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
        title: Text(shoe.name,
          style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: _whiteColor
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 28, color: _whiteColor),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ShoeMainPage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, size: 28, color: _whiteColor),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Выберите действие", textAlign: TextAlign.center),
                    actions: [
                      // Кнопка для удаления записи
                      TextButton(
                        child: Text("Удалить"),
                        onPressed: () {
                          // Получаем экземпляр Hive Box
                          var box = Hive.box<ShoeModel>('shoes');
                          // Удаляем запись из Hive Box
                          box.delete(shoe.key);
                          // Перенаправляем на домашнюю страницу
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ShoeMainPage()),
                          );
                        },
                      ),
                      // Кнопка для редактирования записи
                      TextButton(
                        child: Text("Редактировать"),
                        onPressed: () {
                          //var box = Hive.box<ShoeModel>('Shoes');
                          //box.delete(shoe.key);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditNewShoe(shoe: shoe)));
                          //Navigator.pop(context); // Закрываем диалоговое окно
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Основные данные',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 100.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: shoe.imagePath != null &&
                      File(shoe.imagePath!).existsSync()
                      ? Image.file(
                    File(shoe.imagePath!),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  )
                      : Image.asset(
                    'assets/addshoe/icon_1.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: shoe.name),
                decoration: InputDecoration(
                  labelText: "Название",
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                ),
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: shoe.mark),
                decoration: InputDecoration(
                  labelText: "Марка",
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                ),
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: shoe.model),
                decoration: InputDecoration(
                  labelText: "Модель",
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                ),
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: shoe.comment),
                decoration: InputDecoration(
                  labelText: "Комментарий",
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'О владельце',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: shoe.fio),
                decoration: InputDecoration(
                  labelText: "ФИО",
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                ),
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: shoe.number),
                decoration: InputDecoration(
                  labelText: "Контактный номер",
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
