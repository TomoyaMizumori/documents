import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_practice/todo_add.dart';
import 'package:todo_practice/todo_detail.dart';
import 'package:todo_practice/todo_providers.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider);
    todo.unCompletedList.sort((a, b) => a.id.compareTo(b.id));
    todo.completedList.sort((a, b) => a.id.compareTo(b.id));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO一覧(完了済み${todo.completedList.length}/${todo.unCompletedList.length + todo.completedList.length})',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          todo.viewList.isEmpty && todo.bottomIndex == 0
              ? const SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text('全てのタスクを完了しました！'),
                      Icon(Icons.thumb_up_alt)
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                  itemCount: todo.viewList.length,
                  itemBuilder: (context, index) {
                    final element = todo.viewList[index];
                    return Card(
                      child: ListTile(
                        title: Text('${element.id + 1}  ${element.title}'),
                        contentPadding: const EdgeInsets.all(8),
                        trailing: Checkbox(
                            activeColor: Colors.green,
                            value: element.isCompleted,
                            onChanged: (value) {
                              todo.replaceTodoItem(index);
                            }),
                        onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProviderScope(child: TodoDetail(index: index));
                        })),
                      ),
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
        onTap: (final value) => {todo.changeBottomIndex(value)},
        currentIndex: todo.bottomIndex,
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
