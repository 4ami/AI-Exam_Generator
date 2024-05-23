import 'package:flutter/material.dart';
import 'package:frontend/view/layout/home_layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white30,
      body: SafeArea(
        child: HomeLayoyt(),
      ),
    );
  }
}
