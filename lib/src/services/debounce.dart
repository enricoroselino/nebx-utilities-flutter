import 'dart:async';
import 'dart:ui';

class Debounce {
  late final Duration _delay;
  Timer? _timer;

  Debounce({required Duration delay}) {
    _delay = delay;
  }

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(_delay, action);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }

  static Debounce get debounce250ms =>
      Debounce(delay: const Duration(milliseconds: 250));

  static Debounce get debounce500ms =>
      Debounce(delay: const Duration(milliseconds: 500));

  static Debounce get debounce750ms =>
      Debounce(delay: const Duration(milliseconds: 750));
}
