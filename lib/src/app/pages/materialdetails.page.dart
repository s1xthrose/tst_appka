import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tst_appka/src/app/pages/materialmain.page.dart';

import 'addmaterial.page.dart';
import 'editmaterial.page.dart';

// Define MaterialModel class here or import it if it's defined elsewhere

const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);

class MaterialDetailsPage extends StatelessWidget {
  final MaterialModel mat;

  const MaterialDetailsPage({Key? key, required this.mat}) : super(key: key);

  Future<String> _getImagePath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    return File('${appDocDir.path}/${mat.imagePath}').path;
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
          mat.name,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: _whiteColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 28, color: _whiteColor),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MaterialMainPage()));
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
                      TextButton(
                        child: Text("Удалить"),
                        onPressed: () {
                          var box = Hive.box<MaterialModel>('Mater');
                          box.delete(mat.key);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => MaterialMainPage()));
                        },
                      ),
                      TextButton(
                        child: Text("Редактировать"),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => EditMaterialPage(mat: mat)));
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
              FutureBuilder<String>(
                future: _getImagePath(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Ошибка загрузки изображения');
                  } else {
                    String imagePath = snapshot.data!;
                    return SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: mat.imagePath != null && File(imagePath).existsSync()
                            ? Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        )
                            : Image.asset(
                          'assets/mat/icon_material_placeholder.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    );
                  }
                },
              ),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(text: mat.name),
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
                controller: TextEditingController(text: mat.comment),
                decoration: InputDecoration(
                  labelText: 'Описание (необязательно)',
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
                controller: TextEditingController(text: mat.count),
                decoration: InputDecoration(
                  labelText: 'Количество (штук)',
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
          ),
        ),
      ),
    );
  }
}
