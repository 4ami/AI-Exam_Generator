import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bloc_class/content_bloc.dart';
import 'package:frontend/bloc/event/content_events.dart';

class NumberOfQuestions extends StatefulWidget {
  const NumberOfQuestions({
    super.key,
    required this.controller,
    required this.enabled,
    required this.type,
  });
  final TextEditingController controller;
  final String type;
  final bool enabled;
  @override
  State<NumberOfQuestions> createState() => _NumberOfQuestionsState();
}

class _NumberOfQuestionsState extends State<NumberOfQuestions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 45,
          child: TextFormField(
            controller: widget.controller,
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.number,
            maxLength: 2,
            cursorColor: Colors.grey,
            style: _elementStyle(),
            enabled: false,
            textAlign: TextAlign.center,
            decoration: const InputDecoration().copyWith(
              counter: const Offstage(),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          onPressed: widget.enabled
              ? () {
                  if (int.parse(widget.controller.text) > 1) {
                    setState(() {
                      widget.controller.text =
                          (int.parse(widget.controller.text) - 1).toString();

                      context.read<ContentBloc>().add(
                            UpdateQuestionNumber(
                              type: widget.type,
                              number: int.parse(widget.controller.text),
                            ),
                          );
                    });
                  }
                }
              : null,
          icon: const Icon(Icons.remove, size: 25, color: Colors.redAccent),
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        IconButton(
          onPressed: widget.enabled
              ? () {
                  if (int.parse(widget.controller.text) < 10) {
                    setState(() {
                      widget.controller.text =
                          (int.parse(widget.controller.text) + 1).toString();
                      context.read<ContentBloc>().add(
                            UpdateQuestionNumber(
                              type: widget.type,
                              number: int.parse(widget.controller.text),
                            ),
                          );
                    });
                  }
                }
              : null,
          icon: const Icon(Icons.add, size: 25, color: Colors.greenAccent),
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
      ],
    );
  }

  TextStyle _elementStyle() {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'EXO-R',
          color: Colors.white,
          fontWeight: FontWeight.w600,
        );
  }
}
