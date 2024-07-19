import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';
import 'package:greenus/modules/request_chat/controllers/request_chat_controller.dart';

import '../../../core/components/hover_button.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../components/chat_bubble.dart';

class RequestChatView extends BaseView<RequestChatController> {
  const RequestChatView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Stack(
        children: [
          _background(),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 90),
                Expanded(
                  child: AnimatedList(
                    key: controller.listKey,
                    controller: controller.scrollController,
                    initialItemCount: controller.chatBubbleItemList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 250),
                    itemBuilder: (context, index, animation) {
                      var item = controller.chatBubbleItemList[index];
                      return SizeTransition(
                        sizeFactor: animation,
                        child: ChatBubble(
                          index: index,
                          isMe: item.isMe,
                          message: item.message,
                          backgroundImageUrl: item.backgroundImageUrl,
                          optionContentList: item.optionContentList,
                          optionImageList: item.optionImageList,
                          isActivate: controller.activateStateList[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(child: _optionList()),
          Positioned(bottom: 0, right: 0, left: 0, child: _confirm()),
          Positioned.fill(
            child: _chatInput(),
          ),
        ],
      ),
    );
  }

  Widget _background() => Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/images/mvp/background/gradient_background.png',
              ),
              fit: BoxFit.cover,
            )),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // BottomDim(
              //   reverse: true,
              // ),
            ],
          ),
        ],
      );

  Widget _optionList() => GetBuilder(
      init: controller,
      builder: (context) {
        if (controller.isActivateChat) {
          return const SizedBox();
        }
        return AnimatedOpacity(
          opacity: controller.isShowOption ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:
                  controller.optionList.map((e) => _singleOption(e)).toList(),
            ),
          ),
        );
      });

  Widget _singleOption(String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: HoverButton(
          borderRadius: 15,
          onTap: () {
            controller.choiceOption(text);
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white.withOpacity(0.8),
            ),
            child: Text(
              text,
              style: AppTextStyles.semi16Style
                  .copyWith(color: AppColors.background),
            ),
          ),
        ),
      );

  Widget _confirm() => GetBuilder(
      init: controller,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: HoverButton(
            borderRadius: 15,
            onTap: () {
              Get.offAllNamed(Routes.MAIN);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: controller.endOfProcess ? null : 0,
              padding: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.defaultColor,
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF533BC7),
                        Color(0xDB9172F3),
                      ])),
              child: const Text(
                '확인',
                style: AppTextStyles.semi16Style,
              ),
            ),
          ),
        );
      });

  Widget _chatInput() => GetBuilder(
      init: controller,
      builder: (context) {
        if (!controller.isActivateChat) {
          return const SizedBox();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color: AppColors.blackLightHover,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        focusNode: controller.focusNode,
                        controller: controller.textEditingController,
                        keyboardType: TextInputType.emailAddress,
                        style: AppTextStyles.reg14Style,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.blackLightHover,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: AppColors.grey,
                                width: 1.5,
                              )),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                        ),
                        onChanged: controller.onChangedChat,
                        onFieldSubmitted: controller.submitChat,
                      ),
                    ),
                  ),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () {
                      if (!controller.isChatEmpty) {
                        controller.submitChat(
                            controller.textEditingController.value.text);
                      }
                    },
                    child: Image.asset(
                      'assets/icons/send_icon.png',
                      width: 40,
                      color: controller.isChatEmpty
                          ? AppColors.grey
                          : const Color(0xdb9172f3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
