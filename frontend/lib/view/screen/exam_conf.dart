import 'package:flutter/material.dart';
import 'package:frontend/view/layout/exam_conf_layout.dart';

class ExamConfiguration extends StatelessWidget {
  const ExamConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white30,
      body: SafeArea(
        child: ExamConfLayout(),
      ),
    );
  }
}
