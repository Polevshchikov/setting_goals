import 'package:flutter/material.dart';

class InProgressWidget extends StatelessWidget {
  const InProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      child: Stack(
        children: [
          Center(
            child: Text(
              'IN PROGRESS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 45,
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
