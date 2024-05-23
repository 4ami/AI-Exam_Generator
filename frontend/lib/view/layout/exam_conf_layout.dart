import 'dart:typed_data';
import 'dart:ui';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bloc_class/content_bloc.dart';
import 'package:frontend/bloc/event/content_events.dart';
import 'package:frontend/bloc/state/content_state.dart';
import 'package:frontend/view/widget/loading.dart';
import 'package:frontend/view/widget/table.dart';
import 'package:frontend/view/widget/wave.dart';
import 'package:frontend/view/widget/animated_illustration.dart';
import 'package:frontend/view/widget/glass_container.dart';

class ExamConfLayout extends StatefulWidget {
  const ExamConfLayout({super.key});

  @override
  State<ExamConfLayout> createState() => _ExamConfLayoutState();
}

class _ExamConfLayoutState extends State<ExamConfLayout> {
  String message = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocListener<ContentBloc, ContentState>(
        listener: (context, state) {
          if (state.event is GenerateFail) {
            var ev = state.event as GenerateFail;
            setState(() => message = ev.message);
          } else if (state.event is GenerateSuccess) {
            setState(() => message = '');
            Uint8List fileBytes = state.exam;
            String fileName = '${state.course}-GE.docx';
            _successDialog(context, file: fileBytes, name: fileName);
          }
        },
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: [
            WaveWidget(color: Colors.grey.shade100),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: const SizedBox(),
            ),
            GlassContainer(
              height: 550,
              width: MediaQuery.of(context).size.width * .63,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _heading1(context),
                  const ExamConfigurationTableWidget(),
                  const Divider(height: 10),
                  _generateButton(context),
                  Text(
                    message,
                    style: _heading1(context).style!.copyWith(
                          fontSize: 16,
                          color: Colors.redAccent,
                          fontFamily: 'EXO-R',
                        ),
                  )
                ],
              ),
            ),
            const AnimatedIllustration(),
            if (context.watch<ContentBloc>().state.event is Generate)
              const Loading()
          ],
        ),
      ),
    );
  }

  Container _generateButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: FilledButton(
        clipBehavior: Clip.antiAlias,
        style: _buttonStyle(),
        onPressed: context.watch<ContentBloc>().state.event is! Generate
            ? () {
                log("Generate Start!");
                context.read<ContentBloc>().add(const Generate());
                log("Generate END!");
              }
            : null,
        child: Text(
          "Generate",
          textAlign: TextAlign.center,
          style: _heading1(context).style!.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Future<dynamic> _successDialog(BuildContext context,
      {required Uint8List file, required String name}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(
            'Exam Generated Sucessfully',
            style: _heading1(context)
                .style!
                .copyWith(color: Colors.green, fontFamily: 'EXO-R'),
          ),
          content: TextButton(
            onPressed: () {
              final html.Blob blob = html.Blob([file]);
              final String url = html.Url.createObjectUrlFromBlob(blob);
              final anch = html.AnchorElement(href: url)
                ..target = 'blank'
                ..download = name;
              anch.click();
              html.Url.revokeObjectUrl(url);
            },
            child: const Text(
              'Download Exam',
              style: TextStyle(
                fontFamily: 'EXO-B',
                color: Colors.blue,
              ),
            ),
          ),
        );
      },
    );
  }

  ButtonStyle _buttonStyle() {
    return const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.blue),
    );
  }

  Text _heading1(BuildContext context) {
    return Text(
      "Configure The Exam",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.white,
            fontFamily: 'EXO-B',
          ),
    );
  }
}
