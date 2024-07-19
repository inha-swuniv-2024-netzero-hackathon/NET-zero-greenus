import 'package:get/get.dart';
import 'package:greenus/modules/init/bindings/init_binding.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';
import 'package:greenus/modules/init/pages/init_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INIT;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.INIT,
      binding: InitBinding(),
      page: () => const InitView(),
    )
  ];

}