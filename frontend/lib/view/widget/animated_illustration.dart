import 'package:flutter/material.dart';
import 'package:frontend/core/shared/constant.dart';

class AnimatedIllustration extends StatefulWidget {
  const AnimatedIllustration({
    super.key,
  });

  @override
  State<AnimatedIllustration> createState() => _AnimatedIllustrationState();
}

class _AnimatedIllustrationState extends State<AnimatedIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _tween;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _tween = Tween<Offset>(begin: Offset.zero, end: const Offset(0, .03))
        .animate(_controller);

    _tween.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 2,
      top: 0,
      child: SlideTransition(
        position: _tween,
        child: Image.asset(
          Constants.imageExamIllustration2,
          filterQuality: FilterQuality.high,
          scale: 2,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tween.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }
}
