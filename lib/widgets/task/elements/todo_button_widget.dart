import 'package:flutter/material.dart';
import 'package:setting_goals/widgets/task/elements/task_form_widget.dart';

class TodoButton extends StatelessWidget {
  const TodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            width: 2,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      onTap: () {
        //  TODO  изменить на именнованный роут
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return TaskForm();
          }),
        );
        print('add ToDo');
      },
    );
  }
}
