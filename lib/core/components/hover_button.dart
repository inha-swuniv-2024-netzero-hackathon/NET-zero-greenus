import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class HoverButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final double borderRadius;
  final Color hoverColor;
  final bool disable;
  final BoxConstraints? constraints;

  const HoverButton({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 10.0,
    this.hoverColor = AppColors.black,
    this.disable = false,
    this.constraints,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHover = false;

  void onHover(bool isHover) {
    if (widget.disable) return;
    setState(() {
      this.isHover = isHover;
    });
  }

  void onExit(PointerExitEvent event) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: () {
        if (!widget.disable) {
          widget.onTap();
        }
      },
      mouseCursor:
      widget.disable ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: widget.child),
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: isHover ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                constraints: widget.constraints,
                decoration: BoxDecoration(
                  color: widget.hoverColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
