import 'package:flutter/material.dart';

@immutable
class MyDetail extends StatelessWidget {
  final String? selectedItem;
  const MyDetail({super.key, this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Text(('You selected ${selectedItem.toString()}')),
      ),
    );
  }
}
