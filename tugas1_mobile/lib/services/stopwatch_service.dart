import 'dart:async';

enum StopwatchState { stopped, running, reset }

class StopwatchService {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  StopwatchState state = StopwatchState.stopped;

  void Function(Duration duration)? onTick;

  Duration _initialOffset = Duration.zero;

  void start() {
    if (_stopwatch.isRunning) return;

    state = StopwatchState.running;

    _stopwatch.start();

    _timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      onTick?.call(elapsed);
    });
  }

  void stop() {
    state = StopwatchState.stopped;

    _stopwatch.stop();
    _timer?.cancel();
  }

  void reset() {
    state = StopwatchState.reset;

    _stopwatch.reset();
    _initialOffset = Duration.zero;

    onTick?.call(elapsed);
  }

  void setInitialTime(Duration duration) {
    _initialOffset = duration;
    onTick?.call(elapsed);
  }

  Duration get elapsed => _initialOffset + _stopwatch.elapsed;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final milliseconds = (duration.inMilliseconds.remainder(1000) ~/ 10)
        .toString()
        .padLeft(2, '0');

    return "$minutes:$seconds:$milliseconds";
  }
}
