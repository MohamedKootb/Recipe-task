import '../../domain/entities/detailed_recipe_entity.dart';
import '../models/detailed_recipe.dart';

extension DetailedRecipeMapper on DetailedRecipe {
  DetailedRecipeEntity toEntity() => DetailedRecipeEntity(
    id: id,
    name: name,
    image: image,
    isFeatured: isFeatured,
    creatorLink: creatorLink,
    description: description,
    creatorName: creatorName,
    creatorImage: creatorImage,
    timeMinutes: additionalInfo.time,
    videoLink: additionalInfo.videoLink,
    steps: steps.map((e) => e.toEntity()).toList(),
    ingredients: ingredients.map((e) => e.toEntity()).toList(),
  );
}

extension IngredientMapper on Ingredient {
  IngredientEntity toEntity() => IngredientEntity(
    quantity: quantity,
    isFeatured: isFeatured,
    product: product.toEntity(),
  );
}

extension ProductMapper on Product {
  ProductEntity toEntity() => ProductEntity(
    id: id,
    vat: vat,
    name: name,
    unit: unit,
    weight: weight,
    inStock: inStock,
    vatCost: vatCost,
    imageUrl: imageUrl,
    unitValue: unitValue,
    basePrice: basePrice,
    priceBeforeTax: priceBeforeTax,
    replenishmentTime: replenishmentTime,
    priceBeforeBulkDiscount: priceBeforeBulkDiscount,
  );
}

extension StepMapper on Step {
  StepEntity toEntity() => StepEntity(
    id: id,
    image: image,
    stepNum: stepNum,
    description: description,
  );
}
