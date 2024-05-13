import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tst_appka/src/app/pages/materialmain.page.dart';

import 'addmaterial.page.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

class EditMaterialPage extends StatefulWidget {
  final MaterialModel mat;

  const EditMaterialPage({Key? key, required this.mat}) : super(key: key);

  @override
  _EditMaterialPage createState() => _EditMaterialPage();
}

class _EditMaterialPage extends State<EditMaterialPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    // Установка начальных значений для контроллеров
    nameController.text = widget.mat.name;
    commentController.text = widget.mat.comment;
    countController.text = widget.mat.count;
  }

  @override
  void dispose() {
    nameController.dispose();
    commentController.dispose();
    countController.dispose();
    super.dispose();
  }
  Future<void> _pickImage() async {
    var status = await Permission.photos.request();
    if (status.isDenied) {
      return;
    }

    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
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
          "Редактирование",
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
              MaterialPageRoute(builder: (context) => MaterialMainPage()),
            );
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
                'Замените информацию о материале и его количестве',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
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
                        'assets/mat/icon_material_placeholder.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    )
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
                'Описание (необязательно)',
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
                controller: commentController,
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
                'Количество (штук)',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: countController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')), // разрешаем только буквы и цифры без символов
                ],
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
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: EditNewMaterialButton(
          nameController: nameController,
          commentController: commentController,
          countController: countController,
          imagePath: _pickedImage?.path,
          shoeId: widget.mat.id,
        ),
      ),
    );
  }
}

class EditNewMaterialButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController commentController;
  final TextEditingController countController;
  final String? imagePath;
  final int shoeId;

  const EditNewMaterialButton({
    required this.nameController,
    required this.commentController,
    required this.countController,
    this.imagePath,
    required this.shoeId,
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
          // Получаем экземпляр Hive box
          var box = await Hive.openBox<MaterialModel>('Mater');

          // Обновляем существующий объект обуви в Hive
          box.put(shoeId, MaterialModel(
            name: nameController.text,
            comment: commentController.text,
            count: countController.text,
            imagePath: imagePath,
            id: shoeId, // Передаем существующий id
          ));

          // Переходим на главную страницу
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MaterialMainPage()),
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
