import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/theming/app_sizer.dart';
import 'recipe_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();

  // Ensure first frame only after we have a valid screen size
  await AppSizer.ensureScreenSize();

  runApp(const RecipeApp());
}
