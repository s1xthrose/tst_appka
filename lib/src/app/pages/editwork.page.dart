import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:tst_appka/src/app/pages/home.page.dart';

import 'addmaterial.page.dart';
import 'addshoe.page.dart';
import 'addwork.page.dart';

// Extracted constants
const Color _primaryColor = Color.fromRGBO(88, 86, 214, 1);
const Color _whiteColor = Color.fromRGBO(255, 255, 255, 1);
const double _buttonHeight = 50;
const double _buttonWidth = 0.9;

class EditWrk extends StatefulWidget {

  final WorkModel work;

  const EditWrk({Key? key, required this.work}) : super(key: key);
  @override
  _EditWrkState createState() => _EditWrkState();
}

class _EditWrkState extends State<EditWrk> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController shoeController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode costFocus = FocusNode();
  final FocusNode commentFocus = FocusNode();
  final FocusNode shoeFocus = FocusNode();
  final FocusNode dateFocus = FocusNode();
  late DateTime selectedDate;
  late TextEditingController dateController;
  List<TextEditingController> materialControllers = [];
  late Box<ShoeModel> shoeBox;
  late Box<MaterialModel> materialBox;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.parse(widget.work.date);
    dateController = TextEditingController(text: "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
    nameController.text = widget.work.name;
    costController.text = widget.work.cost;
    commentController.text = widget.work.comment;

    openShoeBox().then((_) {
      setState(() {});
    });

    openMaterialBox().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    costController.dispose();
    commentController.dispose();
    shoeController.dispose();
    nameFocus.dispose();
    costFocus.dispose();
    commentFocus.dispose();
    shoeFocus.dispose();
    dateController.dispose();
    dateFocus.dispose();
    shoeBox.close();
    materialBox.close();
    super.dispose();
  }
  Future<void> openShoeBox() async {
    if (!Hive.isBoxOpen('Shoes')) {
      shoeBox = await Hive.openBox<ShoeModel>('Shoes');
    } else {
      shoeBox = Hive.box<ShoeModel>('Shoes');
    }
  }

  Future<void> openMaterialBox() async {
    if (!Hive.isBoxOpen('Mater')) {
      materialBox = await Hive.openBox<MaterialModel>('Mater');
    } else {
      materialBox = Hive.box<MaterialModel>('Mater');
    }
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
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
                  if (nameController.text == 'Поменять подошву') {
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
                  hintText: 'Поменять подошву',
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
                'Дата сдачи работы',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                      dateController.text =
                      "${picked.day}/${picked.month}/${picked.year}";
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: dateController,
                    focusNode: dateFocus,
                    readOnly: true,
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
                      selectedDate != null ? 'ДД / ММ / ГГ' : '',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                      suffixIcon: Icon(Icons.calendar_today, size: 20),
                    ),
                    style: TextStyle(),
                    cursorHeight: 24,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Стоимость',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: costController,
                focusNode: costFocus,
                onTap: () {
                  if (costController.text == '1 500 рублей') {
                    costController.clear();
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я\s]*')), // разрешаем только буквы и цифры без символов
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
                  hintText: '1 500 рублей',
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
                'Обувь',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
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
              DropdownButtonFormField<String>(
                value: shoeController.text.isNotEmpty ? shoeController.text : null,
                onChanged: (String? newValue) {
                  setState(() {
                    shoeController.text = newValue ?? '';
                  });
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
                  hintText: 'Выберите обувь',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                icon: Icon(
                  CupertinoIcons.chevron_down,
                  size: 20,
                ),
                items: shoeBox?.values.map<DropdownMenuItem<String>>((shoe) {
                  return DropdownMenuItem<String>(
                    value: shoe.name,
                    child: Text(shoe.name),
                  );
                }).toList() ?? [],
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
              SizedBox(height: 12),
              Text(
                'Материалы',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              Column(
                children: [
                  for (int i = 0; i < materialControllers.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: i == materialControllers.length - 1 ? 0 : 12),
                      child: DropdownButtonFormField<String>(
                        value: materialControllers[i].text.isNotEmpty ? materialControllers[i].text : null,
                        onChanged: (String? newValue) {
                          setState(() {
                            materialControllers[i].text = newValue ?? '';
                          });
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
                          hintText: 'Выберите материал',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                        ),
                        icon: Icon(
                          CupertinoIcons.chevron_down,
                          size: 20,
                        ),
                        items: materialBox.values.map<DropdownMenuItem<String>>((mat) {
                          return DropdownMenuItem<String>(
                            value: mat.name,
                            child: Text(mat.name),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    int newIndex = materialControllers.length;
                    materialControllers.add(TextEditingController());
                  });
                },
                icon: Icon(Icons.add, size: 20, color: _primaryColor),
                label: Text(
                  "Добавить материал",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_whiteColor),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
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
        child: AddWrkBtn(
          nameController: nameController,
          costController: costController,
          commentController: commentController,
          shoeController: shoeController,
          materialControllers: materialControllers,
          selectedDate: selectedDate,
        ),
      ),
    );
  }
}

class AddWrkBtn extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController costController;
  final TextEditingController commentController;
  final TextEditingController shoeController;
  final List<TextEditingController> materialControllers;
  final DateTime selectedDate;

  const AddWrkBtn({
    required this.nameController,
    required this.costController,
    required this.commentController,
    required this.shoeController,
    required this.materialControllers,
    required this.selectedDate,
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
          WorkModel work = WorkModel(
            name: nameController.text,
            cost: costController.text,
            comment: commentController.text,
            shoe: shoeController.text,
            materials: List<String>.from(materialControllers.map((e) => e.text)),
            date: selectedDate.toString(),
          );

          var box = await Hive.openBox<WorkModel>('works');

          await box.add(work);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

          box.close();
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
