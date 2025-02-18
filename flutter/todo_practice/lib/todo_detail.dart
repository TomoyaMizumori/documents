import 'package:flutter/material.dart';

class TodoDetail extends StatelessWidget {
  final int? index;
  final String? title;
  final String? content;
  final bool? isCompleted;
  final void Function(int) switchTodoItem;

  const TodoDetail({
    super.key,
    required this.index,
    required this.title,
    required this.content,
    required this.isCompleted,
    required this.switchTodoItem,
  });

  @override
  Widget build(BuildContext context) {
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
              initialValue: title,
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
              initialValue: content,
              onSaved: (value) => {},
              readOnly: true,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                switchTodoItem(index!);
                Navigator.of(context).pop();
              },
              child: isCompleted! ? const Text('未完了にする') : const Text('完了にする'))
        ],
      )),
    );
  }
}
