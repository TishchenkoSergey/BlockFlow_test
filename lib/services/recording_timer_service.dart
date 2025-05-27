import 'dart:async';
import 'dart:ui';

import 'package:injectable/injectable.dart';

abstract class RecordingTimerService {
  void start({required void Function(Duration) onTick});

  void stop();

  void delayEffect({required VoidCallback onDone});
}

@Injectable(as: RecordingTimerService)
class RecordingTimerServiceImpl implements RecordingTimerService {
  Duration _elapsed = Duration.zero;
  Timer? _timer;
  void Function(Duration)? _onTick;

  @override
  void start({required void Function(Duration) onTick}) {
    stop();
    _elapsed = Duration.zero;
    _onTick = onTick;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsed += const Duration(seconds: 1);
      _onTick?.call(_elapsed);
    });
  }

  @override
  void stop() {
    _timer?.cancel();
    _timer = null;
    _onTick = null;
    _elapsed = Duration.zero;
  }

  @override
  void delayEffect({required VoidCallback onDone}) {
    Future.delayed(const Duration(milliseconds: 200), onDone);
  }
}
