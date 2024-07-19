import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenus/core/values/app_text_styles.dart';

import '../../../../core/values/app_colors.dart';
import 'alert_option.dart';

class CustomAlertDialog extends StatelessWidget {
  /// smitz alert option
  final AlertOption option;

  const CustomAlertDialog(this.option, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        option.title,
        style: AppTextStyles.semi16Style,
        textAlign: TextAlign.center,
      ),
      titlePadding: option.titlePadding ??
          (option.content == null
              ? const EdgeInsets.symmetric(vertical: 30, horizontal: 10)
              : const EdgeInsets.only(top: 30, left: 10, right: 10)),
      content: option.content == null
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (option.content!.isNotEmpty)
                    Text(option.content!,
                        style: const TextStyle(
                          color: AppColors.midGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          letterSpacing: -0.2,
                        ),
                      textAlign: TextAlign.center,
                    ),
                  option.contentWidget ?? const SizedBox(),
                ],
              ),
            ),
      contentPadding:
          option.contentPadding ?? const EdgeInsets.only(top: 4, bottom: 14),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 10),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              if (option.isShowCancelPressed)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 8),
                    child: Material(
                      child: InkWell(
                          splashColor: AppColors.transparent,
                          highlightColor:
                              AppColors.darkModeWhite.withOpacity(0.2),
                          onTap: option.onCancelPressed ?? () => Get.back(),
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                                option.cancelPressText ??
                                    '취소',
                                style: AppTextStyles.semi14Style.copyWith(
                                    color: option.cancelPressColor ??
                                        AppColors.white)),
                          )),
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: option.isShowCancelPressed ? 8 : 15, right: 15),
                  child: Material(
                    color: option.confirmPressBtnColor,
                    borderRadius: BorderRadius.circular(10.0),
                    child: InkWell(
                        splashColor: AppColors.transparent,
                        highlightColor:
                            AppColors.darkModeWhite.withOpacity(0.2),
                        onTap: option.onConfirmPressed ?? () => Get.back(),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                              option.confirmPressText ??
                                  '확인',
                              style: AppTextStyles.semi14Style.copyWith(
                                  color: option.confirmPressColor ??
                                      AppColors.white)),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
