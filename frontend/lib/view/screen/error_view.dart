import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text.rich(
          TextSpan(
            text: "Ops!",
            style: Theme.of(context).textTheme.headlineLarge,
            children: [
              TextSpan(
                text: "Unexpected Error 😵",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
