// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedRecipe _$DetailedRecipeFromJson(Map<String, dynamic> json) =>
    DetailedRecipe(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['image'] as String,
      json['isFeatured'] as bool,
      json['creatorLink'] as String?,
      json['description'] as String?,
      json['creatorName'] as String?,
      json['creatorImage'] as String?,
      AdditionalInfo.fromJson(json['additionalInfo']),
      ingredients:
          (json['listProducts'] as List<dynamic>)
              .map(Ingredient.fromJson)
              .toList(),
      steps: (json['steps'] as List<dynamic>).map(Step.fromJson).toList(),
    );

Map<String, dynamic> _$DetailedRecipeToJson(DetailedRecipe instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'isFeatured': instance.isFeatured,
      'creatorLink': instance.creatorLink,
      'description': instance.description,
      'creatorName': instance.creatorName,
      'creatorImage': instance.creatorImage,
      'additionalInfo': instance.additionalInfo,
      'steps': instance.steps,
      'listProducts': instance.ingredients,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
  (json['quantity'] as num?)?.toInt(),
  json['isFeatured'] as bool,
  Product.fromJson(json['product']),
);

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'isFeatured': instance.isFeatured,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  json['id'] as num,
  json['basePrice'] as num,
  json['priceBeforeTax'] as num,
  json['vat'] as num,
  json['vatCost'] as num,
  json['priceBeforeBulkDiscount'] as num,
  json['weight'] as num?,
  json['imageUrl'] as String?,
  json['inStock'] as bool,
  (json['replenishmentTime'] as num).toInt(),
  json['unit'] as String,
  json['unitValue'] as String,
  json['name'] as String,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'basePrice': instance.basePrice,
  'priceBeforeTax': instance.priceBeforeTax,
  'vat': instance.vat,
  'vatCost': instance.vatCost,
  'priceBeforeBulkDiscount': instance.priceBeforeBulkDiscount,
  'weight': instance.weight,
  'imageUrl': instance.imageUrl,
  'inStock': instance.inStock,
  'replenishmentTime': instance.replenishmentTime,
  'unit': instance.unit,
  'unitValue': instance.unitValue,
  'name': instance.name,
};

Step _$StepFromJson(Map<String, dynamic> json) => Step(
  json['id'] as num,
  (json['stepNum'] as num).toInt(),
  json['description'] as String?,
  json['image'] as String?,
);

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
  'id': instance.id,
  'stepNum': instance.stepNum,
  'description': instance.description,
  'image': instance.image,
};
