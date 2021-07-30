import 'package:flutter/material.dart';

class DoneWidget extends StatelessWidget {
  const DoneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Stack(
        children: [
          Center(
            child: Text(
              'DONE',
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
