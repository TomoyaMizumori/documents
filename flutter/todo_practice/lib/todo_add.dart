import 'package:flutter/material.dart';

class TodoAdd extends StatelessWidget {
  const TodoAdd({super.key});

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
          ElevatedButton(onPressed: () {}, child: const Text('追加する'))
        ],
      )),
    );
  }
}
