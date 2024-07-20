import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenus/modules/home/pages/home_view.dart';
import 'package:greenus/modules/main/controllers/main_controller.dart';
import 'package:greenus/modules/planet/pages/planet_view.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/asset_paths.dart';
import '../../qna/pages/qna_view.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: bottomNavigationBar(),
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
                HomeView(),
                PlanetView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Obx(() => Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.black.withOpacity(0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: controller.currentIndex.value,
                onTap: controller.changeBottomNav,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                enableFeedback: true,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                iconSize: 24.0,
                items: [
                  BottomNavigationBarItem(
                    icon: bottomNavIconItem(AssetPath.homeOutlined),
                    activeIcon: bottomNavIconItem(AssetPath.homeOutlined),
                    label: '홈',
                  ),
                  BottomNavigationBarItem(
                    icon: bottomNavIconItem('assets/icons/planet.png'),
                    activeIcon: bottomNavIconItem('assets/icons/planet.png'),
                    label: '플래닛',
                  ),
                ]),
          ),
        ));
  }
}

Widget bottomNavIconItem(String assetPath) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ImageIcon(AssetImage(assetPath)));
}
