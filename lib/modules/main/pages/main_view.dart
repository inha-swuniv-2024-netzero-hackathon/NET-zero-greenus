import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/home/pages/home_view.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';
import 'package:greenus/modules/main/controllers/main_controller.dart';
import 'package:greenus/modules/request/pages/request_view.dart';

import '../../../core/values/asset_paths.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                RequestView(),
                // LibraryView(),
                // ProfileView(),
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
            highlightColor: Colors.white.withOpacity(0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: BottomNavigationBar(
                backgroundColor: Colors.black,
                currentIndex: controller.currentIndex.value,
                onTap: controller.changeBottomNav,
                selectedItemColor: Colors.white,
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
                    icon: bottomNavIconItem(AssetPath.homeOutlined),
                    activeIcon: bottomNavIconItem(AssetPath.homeOutlined),
                    label: '의뢰',
                  ),
                  // BottomNavigationBarItem(
                  //     icon: bottomNavIconItem(AssetPath.homeOutlined),
                  //     activeIcon: bottomNavIconItem(AssetPath.homeOutlined),
                  //     label: '교환'),
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
