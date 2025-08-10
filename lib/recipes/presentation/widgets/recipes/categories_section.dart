import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../domain/entities/category_entity.dart';
import '../../bloc/categories_cubit/categories_cubit.dart';
import 'category_chip.dart';

class CategoriesSection extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          final List<CategoryEntity> categories = switch (state) {
            CategoriesLoaded() => state.categories,
            _ => const [],
          };
          if (categories.isEmpty) return const SizedBox.shrink();

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) return const CategoryChip.all();
              return CategoryChip(category: categories[index - 1]);
            },
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
