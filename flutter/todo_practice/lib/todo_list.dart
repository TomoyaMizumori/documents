import 'package:flutter/material.dart';
import 'package:todo_practice/todo_add.dart';
import 'package:todo_practice/todo_detail.dart';
import 'package:todo_practice/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  int bottomIndex = 0;

  List<TodoItem> get viewList =>
      bottomIndex == 0 ? unCompletedList : completedList;

  final List<TodoItem> unCompletedList = [
    TodoItem(id: 0, title: '課題', content: '期末課題提出', isCompleted: false),
  ];
  final List<TodoItem> completedList = [
    TodoItem(id: 1, title: '掃除', content: '風呂掃除', isCompleted: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: bottomIndex == 0
            ? const Text(
                'TODO一覧(未完了)',
                style: TextStyle(color: Colors.white),
              )
            : const Text(
                'TODO一覧(完了)',
                style: TextStyle(color: Colors.white),
              ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: viewList.length,
            itemBuilder: (context, index) {
              final element = viewList[index];
              return ListTile(
                title: Text('${index + 1}  ${element.title}'),
                trailing: Checkbox(
                    activeColor: Colors.green,
                    value: element.isCompleted,
                    onChanged: (value) {
                      setState(
                        () {
                          element.isCompleted = !element.isCompleted;
                        },
                      );
                    }),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TodoDetail(
                      index: index,
                      title: element.title,
                      content: element.content,
                      isCompleted: element.isCompleted);
                })),
              );
            },
          ))
        ],
      ),
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
        onPressed: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const TodoAdd();
        })),
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
