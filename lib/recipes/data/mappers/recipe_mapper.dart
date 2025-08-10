import '../../domain/entities/recipe_entity.dart';
import '../models/recipe.dart';

extension RecipeMapper on Recipe {
  RecipeEntity toEntity() => RecipeEntity(
    id: id,
    name: name,
    image: image,
    isFeatured: isFeatured,
    creatorLink: creatorLink,
    description: description,
    creatorName: creatorName,
    creatorImage: creatorImage,
    timeMinutes: additionalInfo.time,
  );
}
