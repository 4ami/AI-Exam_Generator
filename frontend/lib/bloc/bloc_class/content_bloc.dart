import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/event/content_events.dart';
import 'package:frontend/bloc/state/content_state.dart';
import 'package:frontend/business/model/question_info.dart';
import 'package:frontend/business/model/request.dart';
import 'package:frontend/business/repository/gpt_repo.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc({required this.repo}) : super(ContentState(exam: Uint8List(0))) {
    on<QuestionAddEvent>((event, emit) {
      QuestionInfo questionInfo = QuestionInfo(
        type: event.type,
        difficulty: '',
        number: 5,
      );

      var qs = [...state.questions, questionInfo];
      emit(state.copyWith(questions: qs));
      for (var element in state.questions) {
        log("Questions: ${element.type}");
      }
    });

    on<QuestionRemovedEvent>((event, emit) {
      var qs = state.questions;
      qs.removeWhere((element) => event.type == element.type);
      emit(state.copyWith(questions: qs));
      for (var element in state.questions) {
        log("Questions: ${element.type}");
      }
    });

    on<UpdateQuestionDifficulty>((event, emit) {
      int index = state.questions.indexWhere(
        (element) => element.type == event.type,
      );
      state.questions[index] =
          state.questions[index].changeDiffculty(difficulty: event.difficulty);
      emit(state);
      for (var element in state.questions) {
        log("${element.type}: ${element.difficulty}");
      }
    });

    on<UpdateQuestionNumber>((event, emit) {
      int index = state.questions.indexWhere(
        (element) => element.type == event.type,
      );
      state.questions[index] =
          state.questions[index].changeNumberOfQ(number: event.number);
      emit(state);
      for (var element in state.questions) {
        log("${element.type}: ${element.number}");
      }
    });

    on<Generate>((event, emit) async {
      emit(state.copyWith(event: const Generate()));
      log("contetn: ${state.content}");
      if (state.content.isEmpty) {
        emit(
          state.copyWith(
              event: const GenerateFail(message: 'Fail To Upload Content')),
        );
        return;
      }

      if (state.questions.isEmpty) {
        emit(
          state.copyWith(
            event: const GenerateFail(
              message: 'Must select at least one question to generate',
            ),
          ),
        );
        return;
      }
      bool haveDifficulty = true;
      for (var element in state.questions) {
        if (element.difficulty.isEmpty) {
          emit(
            state.copyWith(
              event: const GenerateFail(
                message: 'Must specify difficulty for selcted types',
              ),
            ),
          );
          haveDifficulty = false;
          continue;
        }
      }
      if (!haveDifficulty) return;
      log("Number of Content: ${state.content.length}");
      log("Course Number: ${state.course}");
      log("Questions:");
      for (var element in state.questions) {
        log("${element.type}: ${element.difficulty} #${element.number}");
      }

      Map<String, Map<String, dynamic>> questions = {};
      for (var i in state.questions) {
        questions[i.type] = i.toJSON();
        log('Parseing Request:');
        log(i.type);
        log(i.toJSON().toString());
      }
      try {
        GenerateRequest request = GenerateRequest(
          course: state.course,
          questions: questions,
        );

        log('Request Befor Call API');
        log(request.questions.toString());

        Uint8List exam = await repo.generate(
          request: request,
          content: state.content,
        );

        emit(state.copyWith(exam: exam));
        log("Respnse");
        log(exam.toString());
      } catch (e) {
        log("BLOC Error: ", error: e.toString());
        emit(state.copyWith(event: GenerateFail(message: e.toString())));
      }
      emit(state.copyWith(event: const GenerateSuccess()));
    });

    on<ContentsPicked>((event, emit) {
      emit(state.copyWith(content: event.content));
      log("Content Picked");
      state.content.forEach((key, value) => log("$key:$value"));
    });

    on<AddFile>((event, emit) {
      state.append(files: event.files);
      emit(state.copyWith(content: state.content));
      log("Contents After Add");
      state.content.forEach((key, value) => log("$key:$value"));
    });

    on<DropFile>((event, emit) {
      state.drop(key: event.key);
      emit(state.copyWith(content: state.content));
      log("Contents After Drop");
      state.content.forEach((key, value) => log("$key:$value"));
    });

    on<CourseChanged>(
      (event, emit) => emit(
        state.copyWith(course: event.course),
      ),
    );
  }
  final GPTGenerate repo;
}
