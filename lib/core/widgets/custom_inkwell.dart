import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class CustomInkWell extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final bool enabled;
  const CustomInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    return InkWell(
      focusColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
