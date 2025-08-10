import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text.dart';

class SpecificationChip extends StatelessWidget {
  final String label;
  final bool isChosen;
  const SpecificationChip({
    super.key,
    required this.isChosen,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      decoration: BoxDecoration(
        border: _border,
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      alignment: Alignment.center,
      child: AppText(
        label,
        style: TextStyles.font16MediumBlack.copyWith(color: _foregroundColor),
      ),
    );
  }

  Border? get _border {
    if (isChosen) return null;

    return Border.all(color: AppColors.darkGray, width: 1);
  }

  Color get _backgroundColor {
    return isChosen ? AppColors.darkGreen : AppColors.white;
  }

  Color get _foregroundColor {
    return isChosen ? AppColors.limeYellow : AppColors.darkGray;
  }
}
