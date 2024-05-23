class QuestionInfo {
  final String type;
  final String difficulty;
  final int number;
  const QuestionInfo({
    required this.type,
    required this.difficulty,
    required this.number,
  });

  QuestionInfo changeDiffculty({String? difficulty}) => QuestionInfo(
        type: type,
        difficulty: difficulty ?? this.difficulty,
        number: number,
      );
  QuestionInfo changeNumberOfQ({int? number}) => QuestionInfo(
        type: type,
        difficulty: difficulty,
        number: number ?? this.number,
      );

  Map<String, dynamic> toJSON() => {
        'difficulty': difficulty,
        'number_of_questions': number,
      };
}
