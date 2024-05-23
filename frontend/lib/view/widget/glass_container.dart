import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
  });
  final Widget child;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 500,
      width: width ?? MediaQuery.of(context).size.width * .5,
      decoration: _decoration(),
      child: child,
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.purple[900]!.withOpacity(.4),
      borderRadius: BorderRadius.circular(20),
      boxShadow: _containerShadows,
    );
  }

  List<BoxShadow> get _containerShadows {
    return const [
      BoxShadow(
        color: Colors.black38,
        blurRadius: 15,
        spreadRadius: 3,
        blurStyle: BlurStyle.outer,
      )
    ];
  }
}
