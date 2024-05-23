import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bloc_class/content_bloc.dart';
import 'package:frontend/bloc/event/content_events.dart';

class CourseField extends StatelessWidget {
  const CourseField({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    final RegExp coursePattern = RegExp(r'^092\d-\d{3}$');
    return SizedBox(
      width: 350,
      child: Form(
        key: key,
        child: TextFormField(
          controller: controller,
          textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.number,
          maxLength: 8,
          cursorColor: Colors.white38,
          textAlign: TextAlign.center,
          style: _style(context).copyWith(color: Colors.white),
          decoration: _decoration(context),
          onChanged: (value) {
            if (!coursePattern.hasMatch(value)) {
              log('${controller.text} does not conform the correct format of course number [092*-***]');
            }
            context.read<ContentBloc>().add(CourseChanged(course: value));
          },
        ),
      ),
    );
  }

  InputDecoration _decoration(BuildContext context) =>
      const InputDecoration().copyWith(
        filled: true,
        fillColor: Colors.white38,
        label: Text(
          "Course Number",
          style: _style(context),
        ),
        hintStyle: _style(context),
        hintText: "0921-***",
        counter: const Offstage(),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder().copyWith(
          borderSide: const BorderSide(color: Colors.white),
        ),
      );

  TextStyle _style(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'EXO-R',
          fontSize: 15,
          color: Colors.white38,
        );
  }
}
