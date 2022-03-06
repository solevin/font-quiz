class Question {
  Question({
    required this.answerId,
    required this.selectionId,
  });

  Question.fromMap(Map<String, dynamic> paramMap)
      : answerId = paramMap['answer_id'] as int,
        selectionId = paramMap['selection_id'] as int;

  final int answerId;
  final int selectionId;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'answer_id': answerId,
        'section_id': selectionId,
      };
}
