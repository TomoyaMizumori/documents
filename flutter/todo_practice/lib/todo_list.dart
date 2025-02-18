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
    TodoItem(id: 1, title: '掃除', content: '風呂掃除', isCompleted: false),
  ];
  final List<TodoItem> completedList = [
    TodoItem(id: 2, title: '病院', content: '毎週の通院', isCompleted: true),
    TodoItem(id: 3, title: '免許', content: '免許更新', isCompleted: true),
  ];

  void switchTodoItem(int index) {
    debugPrint('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
    setState(() {
      final selectedItem = viewList[index];
      selectedItem.isCompleted = !selectedItem.isCompleted;
      if (selectedItem.isCompleted) {
        unCompletedList.removeAt(index = index);
        completedList.add(selectedItem);
      } else {
        completedList.removeAt(index = index);
        unCompletedList.add(selectedItem);
      }
    });
  }

  void addTodoItem(Map<String, String> formValue) {
    setState(
      () {
        unCompletedList.add(TodoItem(
            id: unCompletedList.length + completedList.length,
            title: formValue['title'] ?? '',
            content: formValue['content'] ?? '',
            isCompleted: false));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO一覧(完了済み${completedList.length}/${unCompletedList.length + completedList.length})',
          style: const TextStyle(color: Colors.white),
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
                title: Text('${element.id + 1}  ${element.title}'),
                trailing: Checkbox(
                    activeColor: Colors.green,
                    value: element.isCompleted,
                    onChanged: (value) {
                      setState(
                        () {
                          switchTodoItem(index);
                        },
                      );
                    }),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TodoDetail(
                    index: index,
                    title: element.title,
                    content: element.content,
                    isCompleted: element.isCompleted,
                    switchTodoItem: switchTodoItem,
                  );
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
          return TodoAdd(
            addTodoItem: addTodoItem,
          );
        })),
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
