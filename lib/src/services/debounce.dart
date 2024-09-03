import 'dart:async';
import 'dart:ui';

class Debounce {
  final Duration delay;
  Timer? _timer;

  Debounce({required this.delay});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
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
