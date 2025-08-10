import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final int id;
  final String name;
  final String image;
  final bool isFeatured;
  final String? creatorLink;
  final String? description;
  final String? creatorName;
  final String? creatorImage;
  final AdditionalInfo additionalInfo;

  const Recipe(
    this.id,
    this.name,
    this.image,
    this.isFeatured,
    this.creatorLink,
    this.description,
    this.creatorName,
    this.creatorImage,
    this.additionalInfo,
  );

  factory Recipe.fromJson(dynamic json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class AdditionalInfo {
  final num id;
  final int time;
  final String? videoLink;

  const AdditionalInfo(this.id, this.time, this.videoLink);

  factory AdditionalInfo.fromJson(dynamic json) =>
      _$AdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);
}
