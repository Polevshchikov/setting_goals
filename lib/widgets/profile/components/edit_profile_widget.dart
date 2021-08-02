import 'package:flutter/material.dart';
import 'package:setting_goals/services/services.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактирование профиля'),
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
                hintText: 'Имя пользователя',
              ),
            ),
            TextField(
              onChanged: (value) {},
              onEditingComplete: () {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Фамилия пользователя',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await getIt
                    .get<Services>()
                    .auth
                    .updateUser(displayName: 'displayName');
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
