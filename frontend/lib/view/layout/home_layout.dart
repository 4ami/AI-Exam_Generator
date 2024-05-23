import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bloc_class/content_bloc.dart';
import 'package:frontend/view/screen/exam_conf.dart';
import 'package:frontend/view/widget/animated_illustration.dart';
import 'package:frontend/view/widget/content_uploader.dart';
import 'package:frontend/view/widget/course_field.dart';
import 'package:frontend/view/widget/glass_container.dart';
import 'package:frontend/view/widget/selected_content.dart';
import 'package:frontend/view/widget/wave.dart';

class HomeLayoyt extends StatefulWidget {
  const HomeLayoyt({super.key});

  @override
  State<HomeLayoyt> createState() => _HomeLayoytState();
}

class _HomeLayoytState extends State<HomeLayoyt> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        children: [
          WaveWidget(color: Colors.deepPurple[600]!, free: .1),
          const WaveWidget(color: Colors.blue, free: .4),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
            child: const SizedBox(),
          ),
          GlassContainer(
            height: 680,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _heading1(context),
                const Divider(height: 50),
                const CourseField(),
                const Divider(height: 10),
                const ContentUploader(),
                const Divider(height: 30),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemBuilder: (context, index) => SelectedContents(
                      name: context
                          .read<ContentBloc>()
                          .state
                          .content
                          .keys
                          .elementAt(index),
                    ),
                    itemCount:
                        context.watch<ContentBloc>().state.content.length,
                  ),
                ),
                const Divider(height: 10),
                if (context.watch<ContentBloc>().state.proceed())
                  _button(context)
              ],
            ),
          ),
          const AnimatedIllustration(),
        ],
      ),
    );
  }

  FilledButton _button(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.green[400]!)),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ExamConfiguration(),
        ),
      ),
      child: Text(
        "Proceed",
        style: _heading1(context).style!.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
      ),
    );
  }

  Text _heading1(BuildContext context) {
    return Text(
      "Upload Course Content",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.white,
            fontFamily: 'EXO-B',
          ),
    );
  }
}
