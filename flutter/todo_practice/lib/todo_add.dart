import 'package:flutter/material.dart';

class TodoAdd extends StatefulWidget {
  final void Function(Map<String, String>) addTodoItem;
  const TodoAdd({super.key, required this.addTodoItem});

  @override
  // ignore: library_private_types_in_public_api
  State<TodoAdd> createState() => _TodoAdd();
}

class _TodoAdd extends State<TodoAdd> {
  final formKey = GlobalKey<FormState>();

  Map<String, String> formValue = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todoを追加',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                      widget.addTodoItem(formValue);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('追加する'))
            ],
          )),
    );
  }
}
