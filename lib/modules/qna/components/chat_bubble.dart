import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../models/chat_bubble_item_model.dart';

/// 챗 버블 위젯
class ChatBubble extends StatelessWidget {
  final int index;
  final bool isMe;
  final String message;
  final bool isActivate;
  final String? backgroundImageUrl;
  final List<OptionContentModel>? optionContentList;
  final List<OptionImageModel>? optionImageList;

  const ChatBubble({
    required this.index,
    required this.isMe,
    required this.message,
    required this.isActivate,
    this.backgroundImageUrl,
    this.optionContentList,
    this.optionImageList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMe
          ? const EdgeInsets.only(right: 15)
          : const EdgeInsets.only(left: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isMe) _avatar(),
                const SizedBox(width: 8),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 0.75,
                  ),
                  decoration: BoxDecoration(
                    color: isMe
                        ? AppColors.defaultColor
                        : AppColors.blackLightHover,
                    gradient: isMe
                        ? const LinearGradient(colors: [
                            Color(0xFF533BC7),
                            Color(0xDB9172F3),
                          ])
                        : null,
                    borderRadius: BorderRadius.only(
                      topRight: isMe
                          ? const Radius.circular(2.0)
                          : const Radius.circular(20.0),
                      topLeft: isMe
                          ? const Radius.circular(20.0)
                          : const Radius.circular(2.0),
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      // if (!isMe && backgroundImageUrl != null)
                      //   animatedVisibility(
                      //     child: ClipRRect(
                      //       borderRadius: const BorderRadius.only(
                      //         topRight: Radius.circular(20.0),
                      //         topLeft: Radius.circular(20.0),
                      //       ),
                      //       child: Image.asset(
                      //         backgroundImageUrl!,
                      //         width: double.infinity,
                      //         height: 120,
                      //         fit: BoxFit.cover,
                      //         alignment: Alignment.center,
                      //       ),
                      //     ),
                      //   ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight:
                                isMe ? FontWeight.w500 : FontWeight.w600,
                            color: isMe
                                ? AppColors.darkModeWhite
                                : AppColors.white,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (optionImageList != null &&
                optionImageList!
                    .any((element) => element.backgroundUrl != null))
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 10),
                child: Wrap(
                  children: optionImageList!
                      .map((e) => _backgroundItem(e.backgroundUrl!))
                      .toList(),
                ),
              ),
            if (optionImageList != null &&
                optionImageList!.any((element) => element.iconUrl != null))
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 10),
                child: Wrap(
                  children: optionImageList!
                      .map((e) => _iconItem(e.iconUrl!, e.backgroundColor!))
                      .toList(),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _backgroundItem(String url) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: SizedBox(
              width: 75,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            )),
      );

  Widget _iconItem(String url, Color backgroundColor) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: SizedBox(
            width: 60,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Image.asset(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );

  Widget animatedVisibility({required Widget child}) {
    return AnimatedSize(
        alignment: Alignment.centerLeft,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
        child: isActivate ? child : const SizedBox());
  }

  Widget optionListTile(OptionContentModel optionContent) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        optionContent.content,
        textAlign: TextAlign.center,
        style: AppTextStyles.semi16Style,
      ),
    );
  }

  Widget _avatar() => Container(
        padding: const EdgeInsets.all(1.5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     Color(0xFF533BC7),
          //     Color(0xDBB49CFF),
          //   ],
          // ),
        ),
        child: const CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage(
              'assets/images/examples/winter_christmas_example_1.png'),
        ),
      );
}
