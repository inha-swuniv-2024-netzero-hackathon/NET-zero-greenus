import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      localizationsDelegates: const [],
      supportedLocales: _getSupportedLocal(),
      locale: Get.locale,
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: InitBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
          useMaterial3: true,
          buttonTheme:
              const ButtonThemeData(shape: ContinuousRectangleBorder()),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black, brightness: Brightness.dark),
          fontFamily: 'Pretendard'),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [],
    );
  }

  List<Locale> _getSupportedLocal() {
    return const [
      Locale('en', 'US'),
      Locale('ko', 'KR'),
      Locale('ja', 'JP'),
    ];
  }
}
