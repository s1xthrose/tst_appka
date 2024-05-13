import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tst_appka/src/app/pages/materialmain.page.dart';

import 'shoemain.page.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

class AddNewMaterial extends StatefulWidget {
  @override
  _AddNewMaterial createState() => _AddNewMaterial();
}

class _AddNewMaterial extends State<AddNewMaterial> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode commentFocus = FocusNode();
  final FocusNode countFocus = FocusNode();
  File? _pickedImage;

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
          "Добавление материала",
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
                MaterialPageRoute(builder: (context) => MaterialMainPage()));
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
                      'assets/addshoe/icon_1.png',
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
                  hintText: 'Подошва',
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
                focusNode: commentFocus,
                onTap: () {
                  if (commentController.text == 'Черная по толщине 12 мм') {
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
                  hintText: 'Черная по толщине 12 мм',
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
                focusNode: countFocus,
                onTap: () {

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
                  hintText: '10',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                style: TextStyle(),
                cursorHeight: 24,
              ),
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
        child: AddNewMaterialButton(
          nameController: nameController,
          commentController: commentController,
          countController: countController,
          imagePath: _pickedImage?.path,
          imageFile: _pickedImage,
        ),
      ),
    );
  }
}

class AddNewMaterialButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController commentController;
  final TextEditingController countController;
  final File? imageFile;
  final String? imagePath;

  const AddNewMaterialButton({
    required this.nameController,
    required this.commentController,
    required this.countController,
    required this.imageFile,
    required this.imagePath,
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
          String? savedImagePath;

          if (imageFile != null) {
            savedImagePath = await _copyImage(imageFile!);
          } else if (imagePath != null) {
            savedImagePath = await _copyImage(File(imagePath!));
          }

          MaterialModel mat = MaterialModel(
            name: nameController.text,
            comment: commentController.text,
            count: countController.text,
            imagePath: savedImagePath,
            id: uniqueId,
          );

          var materialBox = await Hive.openBox<MaterialModel>('Mater');
          await materialBox.put(uniqueId, mat);

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

  Future<String> _copyImage(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final newImagePath = '${directory.path}/$fileName.png';
    await imageFile.copy(newImagePath);
    return newImagePath;
  }
}

@HiveType(typeId: 0)
class MaterialModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String comment;

  @HiveField(2)
  late String count;

  @HiveField(3)
  late String? imagePath;

  @HiveField(4)
  late int id;

  MaterialModel({
    required this.name,
    required this.comment,
    required this.count,
    this.imagePath,
    required this.id,
  });
}

class MaterialModelAdapter extends TypeAdapter<MaterialModel> {
  @override
  final int typeId = 2; // Уникальный typeId для ShoeModel

  @override
  MaterialModel read(BinaryReader reader) {
    return MaterialModel(
      name: reader.readString(),
      comment: reader.readString(),
      count: reader.readString(),
      imagePath: reader.readString(),
      id: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, MaterialModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.comment);
    writer.writeString(obj.count);
    writer.writeString(obj.imagePath ?? '');
    writer.writeInt(obj.id);
  }
}
