import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'shoemain.page.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

class AddNewShoe extends StatefulWidget {
  @override
  _AddNewShoe createState() => _AddNewShoe();
}

class _AddNewShoe extends State<AddNewShoe> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController markController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController fioController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode markFocus = FocusNode();
  final FocusNode modelFocus = FocusNode();
  final FocusNode commentFocus = FocusNode();
  final FocusNode fioFocus = FocusNode();
  final FocusNode numberFocus = FocusNode();
  File? _pickedImage;

  @override
  void dispose() {
    nameController.dispose();
    markController.dispose();
    modelController.dispose();
    commentController.dispose();
    fioController.dispose();
    numberController.dispose();
    super.dispose();
  }
  Future<void> _pickImage() async {
    // Request permission to access the photo library
    var status = await Permission.photos.request();
    if (status.isDenied) {
      // Permission denied
      return;
    }

    final pickedImageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImageFile == null) {
      return;
    }
    final pickedImage = File(pickedImageFile.path);
    setState(() {
      _pickedImage = pickedImage;
    });
  }

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
          "Добавление обуви",
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
                context,
                MaterialPageRoute(builder: (context) => ShoeMainPage()));
          },
        ),
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
              GestureDetector(
                onTap: _pickImage,
                child: SizedBox(
                  width: double.infinity - 20,
                  height: 100.h,
                  child: _pickedImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      _pickedImage!,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/addshoe/icon_placeholder.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Название',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]*')), // разрешаем только символы кириллицы без пробелов и других символов
                ],
                controller: nameController,
                focusNode: nameFocus,
                onTap: () {
                  if (nameController.text == 'Кроссовки') {
                    nameController.clear();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                  hintText: 'Кроссовки',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                style: TextStyle(),
                cursorHeight: 24,
              ),
              SizedBox(height: 12),
              Text(
                'Марка',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                controller: markController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]+')), // разрешаем только буквы и цифры без символов
                ],
                focusNode: markFocus,
                onTap: () {
                  if (markController.text == 'Adidas') {
                    markController.clear();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                  hintText: 'Adidas',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                style: TextStyle(),
                cursorHeight: 24,
              ),
              SizedBox(height: 12),
              Text(
                'Модель',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                controller: modelController,
                focusNode: modelFocus,
                onTap: () {
                  if (modelController.text == 'Samba') {
                    modelController.clear();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                  hintText: 'Samba',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                style: TextStyle(),
                cursorHeight: 24,
              ),
              SizedBox(height: 12),
              Text(
                'Комментарий',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]*')), // разрешаем только символы кириллицы без пробелов и других символов
                ],
                maxLines: 2,
                controller: commentController,
                focusNode: commentFocus,
                onTap: () {
                  if (commentController.text ==
                      'Уже второй раз приносят в починку эту пару') {
                    commentController.clear();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                  hintText:
                  'Уже второй раз приносят в починку эту пару',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                style: TextStyle(),
                cursorHeight: 24,
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
              SizedBox(height: 12),
              Text(
                'ФИО',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]*')), // разрешаем только символы кириллицы без пробелов и других символов
                ],
                controller: fioController,
                focusNode: fioFocus,
                onTap: () {
                  if (fioController.text == 'Иванова Мария Петровна') {
                    fioController.clear();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                  hintText: 'Иванова Мария Петровна',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                style: TextStyle(),
                cursorHeight: 24,
              ),
              SizedBox(height: 12),
              Text(
                'Контактный номер',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                controller: numberController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')), // разрешаем только буквы и цифры без символов
                ],
                focusNode: numberFocus,
                onTap: () {
                  if (numberController.text == '+7 (098) 765 - 43 - 21') {
                    numberController.clear();
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  ),
                  hintText: '+7 (098) 765 - 43 - 21',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                style: TextStyle(),
                cursorHeight: 24,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: _whiteColor,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom + 50,
        ),
        child: AddNewShoeButton(
          nameController: nameController,
          markController: markController,
          modelController: modelController,
          commentController: commentController,
          fioController: fioController,
          numberController: numberController,
          imagePath: _pickedImage?.path,
        ),
      ),
    );
  }
}

class AddNewShoeButton extends StatelessWidget {

  final TextEditingController nameController;
  final TextEditingController markController;
  final TextEditingController modelController;
  final TextEditingController commentController;
  final TextEditingController fioController;
  final TextEditingController numberController;
  final String? imagePath;


  const AddNewShoeButton({

    required this.nameController,
    required this.markController,
    required this.modelController,
    required this.commentController,
    required this.fioController,
    required this.numberController,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () async {
          int uniqueId = DateTime.now().millisecondsSinceEpoch ~/ 1000;

          // Создаем экземпляр модели работы
          ShoeModel shoe = ShoeModel(
            name: nameController.text,
            mark: markController.text,
            model: modelController.text,
            comment: commentController.text,
            fio: fioController.text,
            number: numberController.text,
            imagePath: imagePath,
            id: uniqueId,
          );

          // Открываем Hive box для работы с данными
          var boxshoe = await Hive.openBox<ShoeModel>('Shoes');

          // Сохраняем данные в Hive
          await boxshoe.put(uniqueId, shoe);

          // Переходим на главную страницу
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ShoeMainPage()),
          );
        },
        child: Text(
          "Готово",
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

@HiveType(typeId: 0)
class ShoeModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String mark;

  @HiveField(2)
  late String model;

  @HiveField(3)
  late String comment;

  @HiveField(4)
  late String fio;

  @HiveField(5)
  late String number;

  @HiveField(6)
  late String? imagePath;

  @HiveField(7)
  late int id;

  ShoeModel({
    required this.name,
    required this.mark,
    required this.model,
    required this.comment,
    required this.fio,
    required this.number,
    this.imagePath,
    required this.id,
  });
}

class ShoeModelAdapter extends TypeAdapter<ShoeModel> {
  @override
  final int typeId = 1; // Уникальный typeId для ShoeModel

  @override
  ShoeModel read(BinaryReader reader) {
    return ShoeModel(
      name: reader.readString(),
      mark: reader.readString(),
      model: reader.readString(),
      comment: reader.readString(),
      fio: reader.readString(),
      number: reader.readString(),
      imagePath: reader.readString(),
      id: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ShoeModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.mark);
    writer.writeString(obj.model);
    writer.writeString(obj.comment);
    writer.writeString(obj.fio);
    writer.writeString(obj.number);
    writer.writeString(obj.imagePath ?? '');
    writer.writeInt(obj.id);
  }
}
