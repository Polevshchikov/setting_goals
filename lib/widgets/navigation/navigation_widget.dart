import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:setting_goals/widgets/profile/profile_widget.dart';
import 'package:setting_goals/widgets/task/task_widget.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  _NavigationWidgetState createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  static const List<Widget> _widgetOptions = <Widget>[
    const TaskWidget(),
    const ProfileWidget(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 1,
                blurRadius: 15,
              ),
            ],
          ),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 16,
              bottom: 25,
            ),
            items: [
              /// Task
              SalomonBottomBarItem(
                icon: Icon(Icons.task_alt),
                title: Text("Задачи"),
                selectedColor: Colors.deepOrange,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Профиль"),
                selectedColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
    );
  }
}
