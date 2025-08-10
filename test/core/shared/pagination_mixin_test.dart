import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_task_flutter/core/models/paginated_list.dart';
import 'package:recipe_task_flutter/core/models/pagination_dto.dart';
import 'package:recipe_task_flutter/core/networking/api_result.dart';
import 'package:recipe_task_flutter/core/shared/pagination_mixin.dart';

class _FakeUseCase with PaginationMixin<int> {
  int callCount = 0;
  Future<ApiResult<PaginatedList<int>>> Function(PaginationDto pagination)?
  onCall;

  _FakeUseCase(this.onCall);

  @override
  Future<ApiResult<PaginatedList<int>>> call(PaginationDto dto) async {
    callCount++;
    return onCall!(dto);
  }
}

PaginatedList<int> _page({
  required int pageNumber,
  required int pageSize,
  required List<int> items,
  required bool hasMore,
}) => PaginatedList<int>(
  items: items,
  total: items.length,
  hasMore: hasMore,
  pageSize: pageSize,
  pageNumber: pageNumber,
);

void main() {
  group('PaginationMixin', () {
    test('aggregates items across pages and updates hasMore/page', () async {
      final uc = _FakeUseCase((pagination) async {
        if (pagination.pageNumber == 1) {
          return SuccessResult(
            _page(
              pageNumber: 1,
              pageSize: pagination.pageSize,
              items: const [1, 2],
              hasMore: true,
            ),
          );
        }
        return SuccessResult(
          _page(
            pageNumber: 2,
            pageSize: pagination.pageSize,
            items: const [3],
            hasMore: false,
          ),
        );
      });

      final r1 = await uc.loadNext(pageSize: 2);
      expect(r1, isA<SuccessResult<List<int>>>());
      expect((r1 as SuccessResult<List<int>>).data, [1, 2]);
      expect(uc.hasMore, isTrue);
      expect(uc.lastLoadedPage, 1);

      final r2 = await uc.loadNext(pageSize: 2);
      expect((r2 as SuccessResult<List<int>>).data, [1, 2, 3]);
      expect(uc.hasMore, isFalse);
      expect(uc.lastLoadedPage, 2);
      expect(uc.callCount, 2);
    });

    test(
      'returns current items without calling backend when no more pages',
      () async {
        final uc = _FakeUseCase((pagination) async {
          if (pagination.pageNumber == 1) {
            return SuccessResult(
              _page(
                pageNumber: 1,
                pageSize: pagination.pageSize,
                items: const [1],
                hasMore: false,
              ),
            );
          }
          // Should not be called
          return FailureResult('Should not be called');
        });

        final r1 = await uc.loadNext();
        expect(r1, isA<SuccessResult<List<int>>>());
        expect((r1 as SuccessResult<List<int>>).data, [1]);
        expect(uc.hasMore, isFalse);
        expect(uc.callCount, 1);

        final r2 = await uc.loadNext();
        expect(r2, isA<SuccessResult<List<int>>>());
        expect((r2 as SuccessResult<List<int>>).data, [1]);
        expect(uc.callCount, 1, reason: 'no backend call when hasMore=false');
      },
    );

    test('refresh resets the state and starts from first page', () async {
      final uc = _FakeUseCase((pagination) async {
        if (pagination.pageNumber == 1) {
          return SuccessResult(
            _page(
              pageNumber: 1,
              pageSize: pagination.pageSize,
              items: const [10, 20],
              hasMore: true,
            ),
          );
        }
        return SuccessResult(
          _page(
            pageNumber: 2,
            pageSize: pagination.pageSize,
            items: const [30],
            hasMore: true,
          ),
        );
      });

      await uc.loadNext();
      await uc.loadNext();
      expect(uc.items, [10, 20, 30]);
      expect(uc.lastLoadedPage, 2);
      final r = await uc.loadNext(refresh: true);
      expect((r as SuccessResult<List<int>>).data, [10, 20]);
      expect(uc.lastLoadedPage, 1);
    });

    test('does not mutate state on failure', () async {
      final uc = _FakeUseCase((_) async => FailureResult('boom'));

      final res = await uc.loadNext();
      expect(res, isA<FailureResult<List<int>>>());
      expect(uc.items, isEmpty);
      expect(uc.lastLoadedPage, 0);
      expect(uc.hasMore, isTrue);
    });
  });
}
