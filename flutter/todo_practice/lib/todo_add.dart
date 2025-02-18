import 'package:flutter/material.dart';

class TodoAdd extends StatefulWidget {
  const TodoAdd({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoAdd createState() => _TodoAdd();
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
              onSaved: (value) => {},
              validator: (value) {
                if (value == null || value.isEmpty) {
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
              onSaved: (value) => {},
              validator: (value) {
                if (value == null || value.isEmpty) {
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
                  Navigator.of(context).pop();
                }
              },
              child: const Text('追加する'))
        ],
      )),
    );
  }
}
