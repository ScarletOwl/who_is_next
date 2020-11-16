import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10.0),
        child: new Form(key: _formKey, child: new Column(children: <Widget>[
          Text('Имя учасника:', style: TextStyle(fontSize: 20.0),),
          TextFormField(validator: (value) {
            if (value.isEmpty) return 'Пожалуйста введите свое имя';
          },
          ),
        ],
        )
        )
    );
  }
}
