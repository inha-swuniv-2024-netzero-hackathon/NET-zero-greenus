import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';
import 'package:greenus/modules/main/controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // bottomNavigationBar: bottomNavigationBar(),
      body: Obx(
        () => FadeTransition(
          opacity: controller.animationController,
          child: SlideTransition(
            position: Tween(
              begin: Offset(controller.position.value, 0.0),
              end: Offset.zero,
            ).animate(controller.animationController),
            child: IndexedStack(
              index: controller.currentIndex.value,
              children: const [
                // TodayView(),
                // LibraryView(),
                // ProfileView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
