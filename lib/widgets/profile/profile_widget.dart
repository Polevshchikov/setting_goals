import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:setting_goals/services/services.dart';
import 'package:setting_goals/widgets/profile/components/edit_password_widget.dart';
import 'package:setting_goals/widgets/profile/components/edit_profile_widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late User? user;
  @override
  void initState() {
    super.initState();
    user = getIt.get<Services>().auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBodyWidget(
      userEmail: user!.email ?? 'Почта пользователя',
      userName: user!.displayName ?? 'Имя пользователя',
    );
  }
}

class ProfileBodyWidget extends StatelessWidget {
  final userName;
  // final userSurname;
  final String userEmail;

  const ProfileBodyWidget({
    Key? key,
    required this.userName,
    // this.userSurname = 'Фамилия пользователя',
    required this.userEmail,
  }) : super(key: key);

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
            onPressed: () async {
              await getIt.get<Services>().auth.signOut();
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
            Text('Имя пользователя'),
            Text('Фамилия пользователя'),
            Text(userEmail),
            ElevatedButton(
              onPressed: () {
                //  TODO  изменить на именнованный роут
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return EditPasswordWidget();
                  }),
                );
              },
              child: Text('Изменить пароль'),
            ),
            ElevatedButton(
              onPressed: () {
                //  TODO  изменить на именнованный роут
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return EditProfileWidget();
                  }),
                );
              },
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
