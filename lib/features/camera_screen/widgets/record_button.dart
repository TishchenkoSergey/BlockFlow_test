import 'package:flutter/material.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({
    required this.isRecording,
    required this.takePhoto,
    required this.onTap,
    super.key,
  });

  final bool isRecording;
  final VoidCallback onTap;
  final bool takePhoto;

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _sizeAnimation = Tween<double>(begin: 60, end: 30).animate(_controller);
    _borderRadiusAnimation = Tween<double>(begin: 30, end: 8).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant RecordButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRecording != oldWidget.isRecording) {
      widget.isRecording ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        child:
          widget.takePhoto
            ? const SizedBox.shrink()
            : AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
                  ),
                );
              },
            ),
      ),
    );
  }
}
