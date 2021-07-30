import 'package:flutter/material.dart';

class TestingWidget extends StatelessWidget {
  const TestingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Stack(
        children: [
          Center(
            child: Text(
              'TESTING',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 60,
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
