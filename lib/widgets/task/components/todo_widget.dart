import 'package:flutter/material.dart';
import 'package:setting_goals/widgets/tab_task/tab_task_widget.dart';
import 'package:setting_goals/widgets/task/elements/todo_button_widget.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Stack(
        children: [
          Center(
            child: Text(
              'To Do',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 100,
              ),
            ),
          ),
          Column(
            children: [
              Card(
                child: ListTile(
                  title: Text('Название задачи'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID'),
                      Text('Имя Фамилия'),
                    ],
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    //  TODO  изменить на именнованный роут
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return TabTaskWidget();
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: TodoButton(),
          ),
        ],
      ),
    );
  }
}
