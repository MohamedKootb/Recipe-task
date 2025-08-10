import '../models/paginated_list.dart';
import '../models/pagination_dto.dart';
import '../networking/api_result.dart';
import '../utils/constants.dart';

/// Mixin that adds client-side pagination orchestration to a use case
mixin PaginationMixin<T> {
  // Classes mixing this in must implement the following abstract method:
  Future<ApiResult<PaginatedList<T>>> call(PaginationDto dto);

  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  final _items = <T>[];

  /// The last page that was successfully loaded. 0 when no data is loaded yet.
  int get lastLoadedPage => _items.isEmpty ? 0 : _page - 1;

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;

  /// The full list of paginated items loaded so far (unmodifiable to prevent external modification).
  List<T> get items => List.unmodifiable(_items);

  /// Reset internal pagination state.
  void reset() {
    _page = 1;
    _hasMore = true;
    _isLoading = false;
    _items.clear();
  }

  Future<ApiResult<List<T>>> loadNext({
    int pageSize = Constants.pageSize,
    bool refresh = false,
  }) async {
    if (_isLoading) return SuccessResult(List.unmodifiable(_items));

    if (refresh) reset();

    if (!_hasMore && _items.isNotEmpty) {
      return SuccessResult(List.unmodifiable(_items));
    }

    // Prevents the app from loading the list infinitely. current API is mocked and returns the same result
    if (items.length >= _page * pageSize) {
      return SuccessResult(List.unmodifiable(_items));
    }

    _isLoading = true;
    final result = await call(
      PaginationDto(pageNumber: _page, pageSize: pageSize),
    );
    _isLoading = false;

    switch (result) {
      case SuccessResult():
        _items.addAll(result.data.items);
        _hasMore = result.data.hasMore;
        _page = result.data.pageNumber + 1;

        return SuccessResult(List.unmodifiable(_items));

      case FailureResult():
        return FailureResult(result.errorMessage);
    }
  }
}
