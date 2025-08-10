import 'package:flutter/material.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../../core/utils/event_bus.dart';
import '../../../../core/widgets/custom_inkwell.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';
import '../../events/ingredients_mode_changed.dart';
import 'ingredients_section.dart';
import 'specification_chip.dart';
import 'steps_section.dart';

class IngredientsAndInstructionsSection extends StatefulWidget {
  final DetailedRecipeEntity detailedRecipe;
  const IngredientsAndInstructionsSection({
    super.key,
    required this.detailedRecipe,
  });

  @override
  State<IngredientsAndInstructionsSection> createState() =>
      _IngredientsAndInstructionsSectionState();
}

class _IngredientsAndInstructionsSectionState
    extends State<IngredientsAndInstructionsSection> {
  int _selectedIndex = 0;

  late final _tabs = <({Widget body, String title})>[
    (
      title: 'Ingredients',
      body: IngredientsSection(ingredients: widget.detailedRecipe.ingredients),
    ),
    (
      title: 'Instructions',
      body: StepsSection(steps: widget.detailedRecipe.steps),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Notify initial state (Ingredients tab is default)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventBus.fire(const IngredientsModeChangedEvent(true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            spacing: 8.w,
            children: [
              for (int i = 0; i < _tabs.length; i++)
                Expanded(
                  child: CustomInkWell(
                    onTap: () {
                      setState(() => _selectedIndex = i);
                      eventBus.fire(IngredientsModeChangedEvent(i == 0));
                    },
                    child: SpecificationChip(
                      isChosen: _selectedIndex == i,
                      label: _tabs[i].title,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        _tabs[_selectedIndex].body,
      ],
    );
  }
}
