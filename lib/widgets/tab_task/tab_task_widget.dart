import 'package:flutter/material.dart';

class TabTaskWidget extends StatelessWidget {
  const TabTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text('Название задачи'),
            Text('ID задачи'),
            Text('Описание задачи'),
            Text('Автор задачи'),
            Row(
              children: [
                Text('Имя автора'),
                Text('Фамилия автора'),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text('Статус'),
            )
          ],
        ),
      ),
    );
  }
}
