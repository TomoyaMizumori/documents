class TodoItem {
  String id;
  String title;
  String content;
  bool isCompleted;

  TodoItem(this.id, this.title, this.content, {this.isCompleted = false});

  void toggleIsCompleted() {
    isCompleted = !isCompleted;
  }
}
