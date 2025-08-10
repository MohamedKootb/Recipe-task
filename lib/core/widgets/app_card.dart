import 'dart:math';

import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_sizer.dart';
import 'custom_inkwell.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  const AppCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        width: min(500, 100.fromWidth),
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              spreadRadius: 0,
              offset: const Offset(0, 2),
              color: AppColors.black.withValues(alpha: .08),
            ),
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 0),
              color: AppColors.black.withValues(alpha: .08),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
