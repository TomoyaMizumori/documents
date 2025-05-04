import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_practice/todo_providers.dart';

class TodoDetail extends ConsumerWidget {
  final int index;
  const TodoDetail({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.read(todoProvider).viewList[index];
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
              initialValue: todo.title,
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
              initialValue: todo.content,
              onSaved: (value) => {},
              readOnly: true,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(400, 40)),
              onPressed: () {
                ref.read(todoProvider).replaceTodoItem(index);
                Navigator.of(context).pop();
              },
              child: todo.isCompleted
                  ? const Text('未完了にする')
                  : const Text('完了にする')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 40), backgroundColor: Colors.red),
              onPressed: () {
                ref.read(todoProvider).deleteTodoItem(index);
                Navigator.of(context).pop();
              },
              child: const Text('削除する')),
        ],
      )),
    );
  }
}
