import 'package:flutter/material.dart';
import 'package:navigator_practice/detail_page.dart';

class MyList extends StatelessWidget {
  MyList({super.key});

  final intList = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(('List Page')),
      ),
      body: ListView.builder(
          itemCount: intList.length,
          itemBuilder: (context, index) => ListTile(
                title: Text('This is $index'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyDetail(
                          selectedItem: index.toString(),
                        ))),
              )),
    );
  }
}
