import 'package:flutter/material.dart';
import 'package:frontend/view/widget/curved_animated_painter.dart';

class WaveWidget extends StatefulWidget {
  const WaveWidget({super.key, required this.color, this.free = .05});
  final Color color;
  final double free;
  @override
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          painter: CurvedAnimatedPainter(
            animationValue: _controller.value,
            color: widget.color,
            free: widget.free,
          ),
        );
      },
    );
  }
}
