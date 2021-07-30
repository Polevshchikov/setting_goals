import 'package:flutter/material.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'loading',
                textScaleFactor: 1.0,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
