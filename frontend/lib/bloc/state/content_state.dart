import 'package:flutter/foundation.dart';
import 'package:frontend/bloc/event/content_events.dart';
import 'package:frontend/business/model/question_info.dart';

@immutable
class ContentState {
  const ContentState({
    this.content = const {},
    this.event = const InitEvent(),
    this.questions = const [],
    this.course = '',
    required this.exam,
  });
  final Uint8List exam;
  final String course;
  final List<QuestionInfo> questions;
  final Map<String, Uint8List> content;
  final ContentEvent event;
  bool drop({required String key}) {
    if (content.containsKey(key)) {
      content.remove(key);
      return true;
    }
    return false;
  }

  bool proceed() => content.isNotEmpty && course.isNotEmpty;

  void append({required Map<String, Uint8List> files}) => content.addAll(files);
  ContentState copyWith({
    Map<String, Uint8List>? content,
    ContentEvent? event,
    String? course,
    List<QuestionInfo>? questions,
    Uint8List? exam,
  }) =>
      ContentState(
        exam: exam ?? this.exam,
        content: content ?? this.content,
        event: event ?? this.event,
        questions: questions ?? this.questions,
        course: course ?? this.course,
      );
}
