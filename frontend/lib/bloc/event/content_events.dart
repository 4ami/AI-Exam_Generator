import 'package:flutter/foundation.dart';

@immutable
class ContentEvent {
  const ContentEvent();
}

class InitEvent extends ContentEvent {
  const InitEvent();
}

class ContentsPicked extends ContentEvent {
  const ContentsPicked({required this.content});
  final Map<String, Uint8List> content;
}

class DropFile extends ContentEvent {
  const DropFile({required this.key});
  final String key;
}

class AddFile extends ContentEvent {
  const AddFile({required this.files});
  final Map<String, Uint8List> files;
}

class Generate extends ContentEvent {
  const Generate();
}

class GenerateSuccess extends ContentEvent {
  const GenerateSuccess();
}

class GenerateFail extends ContentEvent {
  const GenerateFail({required this.message});
  final String message;
}

class CourseChanged extends ContentEvent {
  const CourseChanged({required this.course});
  final String course;
}

class QuestionAddEvent extends ContentEvent {
  const QuestionAddEvent({required this.type});
  final String type;
}

class QuestionRemovedEvent extends ContentEvent {
  const QuestionRemovedEvent({required this.type});
  final String type;
}

class UpdateQuestionDifficulty extends ContentEvent {
  const UpdateQuestionDifficulty(
      {required this.type, required this.difficulty});
  final String type;
  final String difficulty;
}

class UpdateQuestionNumber extends ContentEvent {
  const UpdateQuestionNumber({required this.type, required this.number});
  final String type;
  final int number;
}
