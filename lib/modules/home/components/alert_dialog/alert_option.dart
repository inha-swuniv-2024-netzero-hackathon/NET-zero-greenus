import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';

/// smitz alert option class
class AlertOption {
  /// dialog title
  final String title;

  /// dialog content (if content is null, only show title)
  final String? content;

  /// add additional widgets to the bottom of the content
  final Widget? contentWidget;

  /// confirm widget text (default : "confirm")
  final String? confirmPressText;

  /// cancel widget text (default : "cancel")
  final String? cancelPressText;

  /// confirm widget color (default : defaultColor)
  final Color? confirmPressColor;

  /// cancel widget color (default : charcoalColor)
  final Color? cancelPressColor;

  /// alert title (default : back event)
  final Function()? onConfirmPressed;

  /// alert title (default : back event)
  final Function()? onCancelPressed;

  /// hide cancel widget
  final bool isShowCancelPressed;

  /// reverse widgets in action list (default : false)
  final bool reverseActionPress;

  /// customize title padding
  final EdgeInsetsGeometry? titlePadding;

  /// customize content padding
  final EdgeInsetsGeometry? contentPadding;

  final Color confirmPressBtnColor;

  AlertOption({
    required this.title,
    required this.content,
    this.contentWidget,
    this.onConfirmPressed,
    this.onCancelPressed,
    this.titlePadding,
    this.contentPadding,
    this.confirmPressText,
    this.cancelPressText,
    this.confirmPressColor,
    this.cancelPressColor,
    this.isShowCancelPressed = true,
    this.reverseActionPress = false,
    this.confirmPressBtnColor = AppColors.defaultColor,
  });
}