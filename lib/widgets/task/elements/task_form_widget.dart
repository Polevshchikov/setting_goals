import 'package:flutter/material.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новая группа'),
      ),
      body: Center(
        child: Container(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {},
                    onEditingComplete: () {},
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Название задачи',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {},
                    onEditingComplete: () {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Описание задачи',
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Статус'),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.done),
      ),
    );
  }
}
