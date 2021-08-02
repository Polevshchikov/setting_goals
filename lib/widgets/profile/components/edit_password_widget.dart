import 'package:flutter/material.dart';

class EditPasswordWidget extends StatelessWidget {
  const EditPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Смена пароля'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {},
              onEditingComplete: () {},
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите пароль',
              ),
            ),
            TextField(
              onChanged: (value) {},
              onEditingComplete: () {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите повторно пароль',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
