import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {
              print('exit');
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF009688),
                Color.fromARGB(255, 245, 255, 255)
              ],
              begin: const FractionalOffset(1.0, 1.0),
              end: const FractionalOffset(0.0, 0.0),
              stops: [0.0, 0.7],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              child: ClipOval(
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 80,
                ),
              ),
              backgroundColor: Colors.transparent,
              radius: 50,
            ),
            Text('Name'),
            Text('Surname'),
            Text('Email'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Изменить пароль'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Редактировать личные данные'),
            ),
            Container(
              child: null,
            ),
          ],
        ),
      ),
    );
  }
}
