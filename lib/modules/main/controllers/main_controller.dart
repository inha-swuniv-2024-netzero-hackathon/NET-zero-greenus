import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// [NavigationView]의 [BottomNavigationBar]에 대한 controller
class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /// 현재 navigation index
  RxInt currentIndex = RxInt(0);

  /// indexStack에 쌓여있는 view stack
  List<int> bottomHistory = [0];

  /// Page 전환에 따른 animation controller
  late AnimationController animationController;

  /// Page animtaion position
  RxDouble position = RxDouble(1.0);

  /// 바텀 네비게이션 라우트 목록
  final List<String> routeList = ['today', 'library', 'profile'];

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
    animationController.forward(from: 0.0);
  }

  /// bottom navigation을 주어진 인덱스로 변환한다.
  ///
  /// * [hasGesture]는 일반적으로 클릭한 경우 true, android back key에 의해 클릭된 경우 false
  void changeBottomNav(int index, {bool hasGesture = true}) async {
    if (index != currentIndex.value) {
      bool isRightScreen = index > currentIndex.value;
      position(isRightScreen ? 1.0 : -1.0);

      animationController.forward(from: 0.0);
    }

    HapticFeedback.mediumImpact();
    currentIndex(index);

    if (!hasGesture) return;

    if (bottomHistory.contains(index)) {
      bottomHistory.remove(index);
    }

    bottomHistory.add(index);
  }

  /// android의 back key를 이용하여 뒤로가기한 경우에 대해 제어한다.
  Future<bool> willPopAction() async {
    // 더 이상 뒤로갈 페이지가 없을 때
    if (bottomHistory.length == 1) {
      // Get.dialog(SmitzAlertDialog(
      //   AlertOption(
      //       title: S.current.withdrawalPrompt,
      //       content: S.current.exitAppConfirm,
      //       onConfirmPressed: () {
      //         exit(0);
      //       }),
      // ));
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
