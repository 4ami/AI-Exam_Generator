import 'package:flutter/foundation.dart';

@immutable
class GenerateRequest {
  const GenerateRequest({
    required this.course,
    required this.questions,
  });
  final String course;
  final Map<String, Map<String, dynamic>> questions;

  Map<String, dynamic> toJSON() {
    return {
      'course': course,
      'questions': questions.map((key, value) => MapEntry(key, value)),
    };
  }
}
