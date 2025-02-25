import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_practice/todo_providers.dart';

class TodoDetail extends ConsumerWidget {
  final int? index;
  const TodoDetail({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider);
    final selectedTodoItem = todo.viewList[index!];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo詳細',
        ),
      ),
      body: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'タイトル',
              ),
              initialValue: selectedTodoItem.title,
              onSaved: (value) => {},
              readOnly: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '内容',
              ),
              initialValue: selectedTodoItem.content,
              onSaved: (value) => {},
              readOnly: true,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(400, 40)),
              onPressed: () {
                todo.replaceTodoItem(index!);
                Navigator.of(context).pop();
              },
              child: selectedTodoItem.isCompleted
                  ? const Text('未完了にする')
                  : const Text('完了にする'))
        ],
      )),
    );
  }
}
