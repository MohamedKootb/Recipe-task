import '../../domain/entities/category_entity.dart';
import '../models/category.dart';

extension CategoryMapper on Category {
  CategoryEntity toEntity() => CategoryEntity(id: id, name: name);
}
