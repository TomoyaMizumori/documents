import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_practice/todo_item.dart';

final todoProvider = ChangeNotifierProvider((ref) => TodoListNotifier());

class TodoListNotifier extends ChangeNotifier {
  int bottomIndex = 0;

  List<TodoItem> get viewList =>
      bottomIndex == 0 ? unCompletedList : completedList;

  final List<TodoItem> unCompletedList = [
    TodoItem(id: 0, title: '課題', content: '期末課題提出', isCompleted: false),
    TodoItem(id: 1, title: '掃除', content: '風呂掃除', isCompleted: false),
  ];
  final List<TodoItem> completedList = [
    TodoItem(id: 2, title: '病院', content: '毎週の通院', isCompleted: true),
    TodoItem(id: 3, title: '免許', content: '免許更新', isCompleted: true),
  ];

  final List<TodoItem> deletedList = [];

  void changeBottomIndex(int index) {
    bottomIndex = index;
    notifyListeners();
  }

  void addTodoItem(Map<String, String> formValue) {
    unCompletedList.add(TodoItem(
        id: unCompletedList.length + completedList.length + deletedList.length,
        title: formValue['title'] ?? '',
        content: formValue['content'] ?? '',
        isCompleted: false));
    notifyListeners();
  }

  void replaceTodoItem(int index) {
    final selectedTodoItem = viewList[index];

    if (selectedTodoItem.isCompleted) {
      //完了済みのものの場合
      completedList.removeAt(index);
      unCompletedList.add(TodoItem(
          id: selectedTodoItem.id,
          title: selectedTodoItem.title,
          content: selectedTodoItem.content,
          isCompleted: false));
    } else {
      unCompletedList.removeAt(index);
      completedList.add(TodoItem(
          id: selectedTodoItem.id,
          title: selectedTodoItem.title,
          content: selectedTodoItem.content,
          isCompleted: true));
    }
    notifyListeners();
  }

  void deleteTodoItem(int index) {
    final selectedTodoItem = viewList[index];

    if (selectedTodoItem.isCompleted) {
      completedList.removeAt(index);
      deletedList.add(selectedTodoItem);
    } else {
      unCompletedList.removeAt(index);
      deletedList.add(selectedTodoItem);
    }

    notifyListeners();
  }
}
