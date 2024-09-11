class Question_Model {
  final int id;
  final String question;
  final List<String> options;
  final int answer;

  Question_Model({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question_Model &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}