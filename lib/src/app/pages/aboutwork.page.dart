import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'addshoe.page.dart';
import 'addwork.page.dart';

import 'editwork.page.dart';
import 'home.page.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;



class WorkDetailsPage extends StatelessWidget {
  final WorkModel work;
  final ShoeModel shoe;
  const WorkDetailsPage({Key? key, required this.work, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String formattedDate = DateFormat('dd / MM / yy').format(DateTime.parse(work.date));
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
        title: Text(work.name,
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
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
                          var box = Hive.box<WorkModel>('works');
                          // Удаляем запись из Hive Box
                          box.delete(work.key);
                          // Перенаправляем на домашнюю страницу
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                      ),
                      TextButton(
                        child: Text("Редактировать"),
                        onPressed: () {
                          var box = Hive.box<WorkModel>('works');
                          box.delete(work.key);
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => EditWrk(work: work)));
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
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: work.name),
                decoration: InputDecoration(
                  labelText: 'Название',
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
                initialValue: formattedDate,
                //controller: TextEditingController(text: work.date),
                decoration: InputDecoration(
                  labelText: 'Дата сдачи работы',
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
                controller: TextEditingController(text: work.cost),
                decoration: InputDecoration(
                  labelText: 'Стоимость',
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
                controller: TextEditingController(text: work.comment),
                decoration: InputDecoration(
                  labelText: 'Комментарий',
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

              SizedBox(height: 20),
              Text(
                'Обувь',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: work.shoe),
                decoration: InputDecoration(
                  labelText: 'Название',
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
                'Материалы для работы',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: work.materials.map((material) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        readOnly: true,
                        initialValue: material,
                        decoration: InputDecoration(
                          labelText: 'Материал',
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
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
