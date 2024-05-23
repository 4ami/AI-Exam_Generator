import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bloc_class/content_bloc.dart';
import 'package:frontend/bloc/event/content_events.dart';
import 'package:frontend/view/widget/difficulty_element.dart';
import 'package:frontend/view/widget/number_of_questions.dart';
import 'package:frontend/view/widget/type_element.dart';

class ExamConfigurationTableWidget extends StatefulWidget {
  const ExamConfigurationTableWidget({
    super.key,
  });

  @override
  State<ExamConfigurationTableWidget> createState() =>
      _ExamConfigurationTableWidgetState();
}

typedef OnChangeCallBack = void Function(String?);

class _ExamConfigurationTableWidgetState
    extends State<ExamConfigurationTableWidget> {
  String mcqDifficulty = '';
  String tfDifficulty = '';
  String saDifficulty = '';
  final Map<String, bool> questionsMap = {
    "MCQ": false,
    "TF": false,
    "ShortAnswer": false
  };
  final TextEditingController _mcqController = TextEditingController()
    ..text = "5";
  final TextEditingController _tfController = TextEditingController()
    ..text = "5";
  final TextEditingController _saController = TextEditingController()
    ..text = "5";
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: _tableHeader(context),
      rows: [
        _typeRow(
          name: "Multiple Choice",
          key: "MCQ",
          difficulty: questionsMap['MCQ']! ? mcqDifficulty : mcqDifficulty = '',
          controller: _mcqController,
          onChange: (s) => setState(() {
            mcqDifficulty = s!;
            context.read<ContentBloc>().add(
                  UpdateQuestionDifficulty(
                      type: 'MCQ', difficulty: mcqDifficulty),
                );
          }),
        ),
        _typeRow(
          name: "True/False",
          key: "TF",
          difficulty: questionsMap['TF']! ? tfDifficulty : tfDifficulty = '',
          controller: _tfController,
          onChange: (s) => setState(() {
            tfDifficulty = s!;
            context.read<ContentBloc>().add(
                  UpdateQuestionDifficulty(
                      type: "TF", difficulty: tfDifficulty),
                );
          }),
        ),
        _typeRow(
          name: "Short Answer",
          key: "ShortAnswer",
          difficulty:
              questionsMap['ShortAnswer']! ? saDifficulty : saDifficulty = '',
          controller: _saController,
          onChange: (s) => setState(() {
            saDifficulty = s!;
            context.read<ContentBloc>().add(
                  UpdateQuestionDifficulty(
                      type: 'ShortAnswer', difficulty: saDifficulty),
                );
          }),
        ),
      ],
    );
  }

  DataRow _typeRow({
    required String name,
    required String key,
    required String difficulty,
    required OnChangeCallBack onChange,
    required TextEditingController controller,
  }) {
    return DataRow(
      cells: [
        DataCell(
          TypeElement(
            typName: name,
            typeValue: questionsMap[key]!,
            onChange: (v) {
              setState(() {
                questionsMap[key] = v!;
                if (questionsMap[key]!) {
                  context.read<ContentBloc>().add(QuestionAddEvent(type: key));
                  return;
                }
                context
                    .read<ContentBloc>()
                    .add(QuestionRemovedEvent(type: key));
              });
            },
          ),
        ),
        DataCell(
          DifficultyElement(
            difficulty: 'Easy',
            groupValue: difficulty,
            onChange: questionsMap[key]! ? onChange : null,
          ),
        ),
        DataCell(
          DifficultyElement(
            difficulty: 'Medium',
            groupValue: difficulty,
            onChange: questionsMap[key]! ? onChange : null,
          ),
        ),
        DataCell(
          DifficultyElement(
            difficulty: 'Hard',
            groupValue: difficulty,
            onChange: questionsMap[key]! ? onChange : null,
          ),
        ),
        DataCell(
          NumberOfQuestions(
            controller: controller,
            enabled: questionsMap[key]!,
            type: key,
          ),
        ),
      ],
    );
  }

  List<DataColumn> _tableHeader(BuildContext context) {
    return [
      DataColumn(
        label: Text(
          "Question Type",
          style: _heading1(context),
        ),
      ),
      DataColumn(
        label: Text(
          "Easy",
          style: _heading1(context),
        ),
      ),
      DataColumn(
        label: Text(
          "Medium",
          style: _heading1(context),
        ),
      ),
      DataColumn(
        label: Text(
          "Hard",
          style: _heading1(context),
        ),
      ),
      DataColumn(
        label: Text(
          "Questions No.",
          style: _heading1(context),
        ),
      ),
    ];
  }

  TextStyle _heading1(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontSize: 14,
          color: Colors.white,
          fontFamily: 'EXO-R',
        );
  }
}
