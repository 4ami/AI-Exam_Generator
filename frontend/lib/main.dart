import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bloc_class/content_bloc.dart';
import 'package:frontend/business/repository/gpt_repo.dart';
import 'package:frontend/view/screen/error_view.dart';
import 'package:frontend/view/screen/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  try {
    await dotenv.load(fileName: ".env");
    runApp(const App(home: Home()));
  } catch (e) {
    log("Main: ${e.toString()}");
    runApp(const App(home: ErrorView()));
  }
}

class App extends StatelessWidget {
  const App({super.key, required this.home});
  final Widget home;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContentBloc>(
      create: (context) => ContentBloc(repo: const GPTGenerate()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        title: "Exam Generator",
        home: home,
      ),
    );
  }
}
