import 'package:flutter/material.dart';
import 'package:greenus/core/values/app_text_styles.dart';

import '../../../core/values/app_colors.dart';

/// 하단 확인 버튼 위젯
class BottomConfirmWidget extends StatelessWidget {
  final bool condition;
  final String text;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final bool isLoading;

  const BottomConfirmWidget(
      {super.key,
      required this.condition,
      required this.text,
      required this.onTap,
      this.padding = const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        color: AppColors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.defaultColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            highlightColor: condition ? null : AppColors.transparent,
            splashColor: condition ? null : AppColors.transparent,
            onTap: () {
              if (condition && !isLoading) onTap();
            },
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minHeight: 55),
                  child: isLoading
                      ? const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          text,
                          style: AppTextStyles.semi16Style,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: condition ? 0 : 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: AppColors.blackZero.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
