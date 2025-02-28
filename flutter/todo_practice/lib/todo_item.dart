class TodoItem {
  final int id;
  final String title;
  final String content;
  final bool isCompleted;

  // ignore: avoid_positional_boolean_parameters
  TodoItem({
    required this.id,
    required this.title,
    required this.content,
    required this.isCompleted,
  });
}
