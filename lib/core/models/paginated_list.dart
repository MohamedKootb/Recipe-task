import 'package:json_annotation/json_annotation.dart';

part 'paginated_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedList<T> {
  final bool hasMore;
  final int total;
  final int pageSize;
  final int pageNumber;
  final List<T> items;

  const PaginatedList({
    required this.items,
    required this.total,
    required this.hasMore,
    required this.pageSize,
    required this.pageNumber,
  });

  factory PaginatedList.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginatedListToJson(this, toJsonT);

  PaginatedList<L> copyWith<L>({required List<L>? items}) {
    return PaginatedList(
      items: items ?? [],
      total: total,
      hasMore: hasMore,
      pageSize: pageSize,
      pageNumber: pageNumber,
    );
  }
}
