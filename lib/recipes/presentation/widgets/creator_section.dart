import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/app_text.dart';

class CreatorSection extends StatelessWidget {
  final String? creatorName;
  final String? creatorImage;
  final String? creatorLink;
  final bool isDetailsScreen;

  const CreatorSection({
    super.key,
    this.creatorName,
    this.creatorImage,
    this.creatorLink,
  }) : isDetailsScreen = false;

  const CreatorSection.details({
    super.key,
    this.creatorName,
    this.creatorImage,
    this.creatorLink,
  }) : isDetailsScreen = true;

  @override
  Widget build(BuildContext context) {
    if (creatorName == null || creatorImage == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Container(
          width: 30.w,
          height: 30.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: AppImage(creatorImage!, fit: BoxFit.contain),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('Prepared by', style: TextStyles.font10MediumDarkGray),
              Row(
                children: [
                  AppText(
                    creatorName!,
                    style: TextStyles.font13SemiBoldDarkGreen.copyWith(
                      color:
                          isDetailsScreen
                              ? AppColors.black
                              : AppColors.darkGreen,
                    ),
                  ),

                  if (isDetailsScreen && creatorLink != null) ...[
                    SizedBox(width: 4.w),
                    Icon(Icons.link_outlined, size: 16.w),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
