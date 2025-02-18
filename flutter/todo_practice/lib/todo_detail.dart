import 'package:flutter/material.dart';

class TodoDetail extends StatelessWidget {
  final int? index;
  final String? title;
  final String? content;
  final bool? isCompleted;
  const TodoDetail(
      {super.key, this.index, this.title, this.content, this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo詳細',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'タイトル$index',
              ),
              onSaved: (value) => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '内容',
              ),
              onSaved: (value) => {},
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              child: isCompleted! ? const Text('未完了にする') : const Text('完了にする'))
        ],
      )),
    );
  }
}
