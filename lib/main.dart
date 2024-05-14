import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tst_appka/src/app.dart';

import 'src/app/pages/addmaterial.page.dart';
import 'src/app/pages/addshoe.page.dart';
import 'src/app/pages/addwork.page.dart';

void registerHiveAdapters() {
  Hive.registerAdapter(WorkModelAdapter());
  Hive.registerAdapter(ShoeModelAdapter());
  Hive.registerAdapter(MaterialModelAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  registerHiveAdapters(); // Регистрируем адаптер
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Оборачиваем MyApp в DevicePreview
    ),
  );
}
