import '../../../core/utils/constants.dart';

class RecipeEntity {
  final int id;
  final String name;
  final String image;
  final bool isFeatured;
  final int timeMinutes;
  final String? creatorLink;
  final String? description;
  final String? creatorName;
  final String? creatorImage;

  const RecipeEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.creatorLink,
    required this.description,
    required this.creatorName,
    required this.creatorImage,
    required this.timeMinutes,
  });

  static const mock = RecipeEntity(
    id: 0,
    name: 'name',
    image: Constants.placeholder,
    isFeatured: false,
    creatorLink: '',
    description: '',
    creatorName: 'creatorName',
    creatorImage: Constants.placeholder,
    timeMinutes: 80,
  );
}
