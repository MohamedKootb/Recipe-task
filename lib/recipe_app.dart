import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/routing/app_routes.dart';
import 'core/theming/app_colors.dart';
import 'core/theming/app_sizer.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSizerInitializer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Recipe Task',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkGreen),
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
