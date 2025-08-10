import 'dart:async';

final eventBus = _EventBus();

/// Dispatches events to listeners using the Dart [Stream] API. The [_EventBus]
/// enables decoupled applications. It allows objects to interact without
/// requiring to explicitly define listeners and keeping track of them.
///
/// Not all events should be broadcasted through the [_EventBus] but only those of
/// general interest.
class _EventBus {
  final StreamController _streamController;
  _EventBus() : _streamController = StreamController.broadcast(sync: false);

  /// Listens for events of Type [T] and its subtypes.
  ///
  /// If the method is called without a type parameter, the [Stream] contains every
  /// event of this [_EventBus].
  ///
  /// The returned [Stream] is a broadcast stream so multiple subscriptions are
  /// allowed.
  ///
  /// Each listener is handled independently, and if they pause, only the pausing
  /// listener is affected. A paused listener will buffer events internally until
  /// unpaused or canceled. So it's usually better to just cancel and later
  /// subscribe again (avoids memory leak).
  ///
  Stream<T> on<T>() {
    if (T == dynamic) {
      return _streamController.stream as Stream<T>;
    } else {
      return _streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  /// Fires a new event on the event bus with the specified [event].
  void fire(event) => _streamController.add(event);

  /// Destroy this [_EventBus]. This is generally only in a testing context.
  void destroy() => _streamController.close();
}
