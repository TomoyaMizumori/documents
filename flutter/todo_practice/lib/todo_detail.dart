import 'package:flutter/material.dart';

class TodoDetail extends StatefulWidget {
  const TodoDetail({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoDetail createState() => _TodoDetail();
}

class _TodoDetail extends State<TodoDetail> {
  final formKey = GlobalKey<FormState>();
  Map<String, String> formValue = {};

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
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'フォーム１',
                  ),
                  onSaved: (value) => {formValue['form1'] = value.toString()},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'フォーム2',
                  ),
                  onSaved: (value) => {formValue['form2'] = value.toString()},
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          formKey.currentState?.save();
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
