// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedList<T> _$PaginatedListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedList<T>(
  items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
  total: (json['total'] as num).toInt(),
  hasMore: json['hasMore'] as bool,
  pageSize: (json['pageSize'] as num).toInt(),
  pageNumber: (json['pageNumber'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedListToJson<T>(
  PaginatedList<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'hasMore': instance.hasMore,
  'total': instance.total,
  'pageSize': instance.pageSize,
  'pageNumber': instance.pageNumber,
  'items': instance.items.map(toJsonT).toList(),
};
