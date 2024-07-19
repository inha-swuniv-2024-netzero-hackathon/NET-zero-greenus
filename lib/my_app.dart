import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenus/core/bindings/initial_binding.dart';
import 'package:greenus/modules/init/bindings/init_binding.dart';
import 'package:greenus/routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        buttonTheme: const ButtonThemeData(shape: ContinuousRectangleBorder()),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, brightness: Brightness.light),
        fontFamily: 'Pretendard',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
