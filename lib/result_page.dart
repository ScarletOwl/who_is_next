import 'dart:typed_data';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final Uint8List resultPhoto;

  ResultPage({@required this.resultPhoto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            child: Text('Победитель:', textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
          ),
          Image.memory(resultPhoto, height: 200),
        ],
      ),
    );
  }
}
