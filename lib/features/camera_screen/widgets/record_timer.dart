import 'package:flutter/material.dart';

class RecordingTimer extends StatelessWidget {
  const RecordingTimer({
    required this.duration,
    super.key,
  });

  final Duration duration;


  String get formatted {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (duration == Duration.zero) return const SizedBox.shrink();

    return Row(
      children: [
        const Icon(Icons.fiber_manual_record, color: Colors.red, size: 18),
        const SizedBox(width: 6),
        Text(
          formatted,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
