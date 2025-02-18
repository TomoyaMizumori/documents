import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  int bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO LIST')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.unpublished), label: '未完了'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outlined), label: '完了'),
        ],
        onTap: (final value) => {
          setState(() {
            bottomIndex = value;
          })
        },
        currentIndex: bottomIndex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('新規TODO作成'),
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
