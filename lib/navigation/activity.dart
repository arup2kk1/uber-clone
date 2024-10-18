import 'package:flutter/material.dart';

class ActivityPage1 extends StatelessWidget {
  const ActivityPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.centerLeft, // Aligns title to the left
          child: Text(
            'Activity',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
