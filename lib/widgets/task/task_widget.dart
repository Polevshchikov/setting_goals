import 'package:flutter/material.dart';

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
              Tab(
                text: 'To Do',
              ),
              Tab(
                text: 'In Progress',
              ),
              Tab(
                text: 'Testing',
              ),
              Tab(
                text: 'Done',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.green,
              child: Center(
                child: Text('Домашняя страница'),
              ),
            ),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}

// floatingActionButton: GestureDetector(
//           child: Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.5),
//                   spreadRadius: 1,
//                   blurRadius: 5,
//                   offset: Offset(0, 2), // changes position of shadow
//                 ),
//               ],
//               border: Border.all(
//                 width: 2,
//                 color: Colors.black,
//                 style: BorderStyle.solid,
//               ),
//             ),
//             child: Center(
//                 child: Icon(
//               Icons.add,
//               color: Colors.black,
//             )),
//           ),
//           onTap: () {
//             print('add ToDo');
//           },
//         ),