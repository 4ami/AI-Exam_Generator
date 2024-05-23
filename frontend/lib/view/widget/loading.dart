import 'dart:ui';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: const Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeCap: StrokeCap.round,
            strokeWidth: 9,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
      ),
    );
  }
}
