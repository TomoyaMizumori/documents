import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_practice/todo_providers.dart';

class TodoAdd extends ConsumerStatefulWidget {
  const TodoAdd({super.key});

  @override
  ConsumerState<TodoAdd> createState() => _TodoAddState();
}

class _TodoAddState extends ConsumerState<TodoAdd> {
  final formKey = GlobalKey<FormState>();

  Map<String, String> formValue = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todoを追加',
        ),
      ),
      body: Form(
          key: formKey,
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
                  onSaved: (value) => {formValue['title'] = value.toString()},
                  validator: (value) {
                    if (value == null) {
                      return '必須項目です';
                    } else if (value.isEmpty) {
                      return '必須項目です';
                    } else if (value.length > 30) {
                      return 'タイトルは30文字以内です';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '内容',
                  ),
                  onSaved: (value) => {formValue['content'] = value.toString()},
                  validator: (value) {
                    if (value == null) {
                      return '必須項目です';
                    } else if (value.isEmpty) {
                      return '必須項目です';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(400, 40)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                      ref.read(todoProvider).addTodoItem(formValue);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('追加する'))
            ],
          )),
    );
  }
}
