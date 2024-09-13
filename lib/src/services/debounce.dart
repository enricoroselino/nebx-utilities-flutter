import 'dart:async';
import 'dart:ui';

abstract interface class IDebounce {
  void run(VoidCallback action);

  void dispose();
}

class Debounce implements IDebounce {
  late final Duration _delay;
  Timer? _timer;

  Debounce._({required Duration delay}) {
    _delay = delay;
  }

  @override
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(_delay, action);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
  }

  static IDebounce get debounce250ms =>
      Debounce._(delay: const Duration(milliseconds: 250));

  static IDebounce get debounce500ms =>
      Debounce._(delay: const Duration(milliseconds: 500));

  static IDebounce get debounce750ms =>
      Debounce._(delay: const Duration(milliseconds: 750));
}
