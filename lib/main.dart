import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_app.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  Get.testMode = true;

  runApp(const MyApp());
}

