import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../theming/app_colors.dart';

class AppShimmer extends StatelessWidget {
  final bool enabled;
  final Widget child;
  const AppShimmer({super.key, this.enabled = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      effect: const ShimmerEffect(
        baseColor: AppColors.shimmerBase,
        highlightColor: AppColors.white,
      ),
      child: child,
    );
  }
}
