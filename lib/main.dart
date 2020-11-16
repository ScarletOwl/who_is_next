import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:who_is_next/Form.dart';
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
        home: Scaffold( appBar: AppBar(
            title: Text('Кто сегодня...')
        ) ,
          body:Container(child:
              Text('Нажми на кнопку для дабавление учасника'),


          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _cam,
            tooltip: 'Increment',
            child: Icon(Icons.add_a_photo_outlined),
          ),
        )
    );
  }
  void _cam(){
    final _foto=ImagePicker();
    _foto.getImage(source: ImageSource.camera);
  }
}
