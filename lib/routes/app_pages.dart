import 'package:get/get.dart';
import 'package:greenus/modules/init/bindings/init_binding.dart';
import 'package:greenus/modules/init/pages/init_view.dart';
import 'package:greenus/modules/main/bindings/main_binding.dart';
import 'package:greenus/modules/main/pages/main_view.dart';
import 'package:greenus/modules/qna/pages/qna_view.dart';

import '../modules/qna/bindings/qna_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INIT;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.INIT,
      binding: InitBinding(),
      page: () => const InitView(),
    ),
    GetPage(
      name: Routes.MAIN,
      binding: MainBinding(),
      page: () => const MainView(),
    ),
    GetPage(
      name: Routes.QNA,
      binding: QnaBinding(),
      page: () => const QnaView(),
    ),
    GetPage(
      name: Routes.MAIN,
      binding: MainBinding(),
      page: () => const MainView(),
    ),
  ];
}
