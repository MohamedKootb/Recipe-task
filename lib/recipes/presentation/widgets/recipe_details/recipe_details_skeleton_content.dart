import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';
import '../creator_section.dart';
import '../spotlight_section.dart';
import '../time_section.dart';
import 'recipe_details_skeleton_app_bar.dart';

class RecipeDetailsSkeletonContent extends StatelessWidget {
  final DetailedRecipeEntity item;
  const RecipeDetailsSkeletonContent({super.key})
    : item = DetailedRecipeEntity.mock;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const RecipeDetailsSkeletonAppBar(),
          // Title + description + ingredients section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 96.h),
              // bottom padding leaves room for the persistent CTA when visible
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpotlightSection(isFeatured: item.isFeatured, id: item.id),
                  SizedBox(height: 8.h),
                  AppText(
                    item.name,
                    maxLines: 2,
                    style: TextStyles.font20BoldBlack,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: CreatorSection.details(
                          creatorName: item.creatorName,
                          creatorImage: item.creatorImage,
                          creatorLink: item.creatorLink,
                        ),
                      ),
                      TimeSection(
                        minutes: item.timeMinutes,
                        id: item.id,
                        backgroundColor: AppColors.gray,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
