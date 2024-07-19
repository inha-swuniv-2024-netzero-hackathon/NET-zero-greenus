import 'package:get/get.dart';
import 'package:greenus/modules/init/bindings/init_binding.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';
import 'package:greenus/modules/init/pages/init_view.dart';
import 'package:greenus/modules/main/bindings/main_binding.dart';
import 'package:greenus/modules/main/pages/main_view.dart';

import '../modules/request_chat/bindings/request_chat_binding.dart';
import '../modules/request_chat/pages/request_chat_view.dart';

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
      name: Routes.REQUEST_CHAT,
      binding: RequestChatBinding(),
      page: () => const RequestChatView(),
    ),
    GetPage(
      name: Routes.MAIN,
      binding: MainBinding(),
      page: () => const MainView(),
    )
  ];
}
