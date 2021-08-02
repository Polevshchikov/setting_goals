import 'package:flutter/material.dart';
import 'package:setting_goals/widgets/task/components/done_widget.dart';
import 'package:setting_goals/widgets/task/components/inProgress_widget.dart';
import 'package:setting_goals/widgets/task/components/testing_widget.dart';
import 'package:setting_goals/widgets/task/components/todo_widget.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.white,
          title: Text(
            'Задачи',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
          bottom: TabBar(
            indicatorWeight: 2,
            unselectedLabelColor: Colors.black38,
            labelColor: Colors.indigo,
            tabs: [
              Tab(text: 'To Do'),
              Tab(text: 'In Progress'),
              Tab(text: 'Testing'),
              Tab(text: 'Done'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ToDoWidget(),
            InProgressWidget(),
            TestingWidget(),
            DoneWidget(),
          ],
        ),
      ),
    );
  }
}
