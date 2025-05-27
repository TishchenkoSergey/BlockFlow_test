import 'package:flutter/material.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({
    required this.isRecording,
    required this.isPhotoMode,
    required this.onTap,
    super.key,
  });

  final bool isRecording;
  final VoidCallback onTap;
  final bool isPhotoMode;

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
        ),
        alignment: Alignment.center,
        child: widget.isPhotoMode
          ?  const SizedBox.shrink()
          : AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: widget.isRecording ? 24 : 60,
            height: widget.isRecording ? 24 : 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(widget.isRecording ? 8 : 30),
            ),
          ),
      ),
    );
  }
}
