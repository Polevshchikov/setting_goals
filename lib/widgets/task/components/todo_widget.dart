import 'package:flutter/material.dart';

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
                  title: Text('group.name'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
