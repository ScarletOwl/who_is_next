import 'package:flutter/material.dart';
import 'package:who_is_next/list.dart';

void main() {
  runApp(NewRandom());
}

class NewRandom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ParticipantsList(),
    );
  }
}
