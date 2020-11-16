import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:who_is_next/result_page.dart';

class ParticipantsList extends StatefulWidget {
  @override
  _ParticipantsListState createState() => _ParticipantsListState();
}

class _ParticipantsListState extends State<ParticipantsList> {
  final List<Uint8List> photos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кто сегодня...'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => setState(() => photos.clear()),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          photos.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: Text('Нажми на кнопку для дабавление учасника'),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  children: photos.map((photo) => _photo(photo)).toList(),
                ),
          if (photos.isNotEmpty) _selectButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cam,
        tooltip: 'Добавить фото',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _cam() async {
    final _foto = ImagePicker();
    final pickedPhoto = await _foto.getImage(source: ImageSource.gallery);
    if (pickedPhoto != null) {
      final pickedPhotoBytes = await pickedPhoto.readAsBytes();
      setState(() => photos.add(pickedPhotoBytes));
    }
  }

  Widget _photo(Uint8List photoBytes) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(child: Image.memory(photoBytes)),
        Container(
          color: Colors.black54,
          child: IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => setState(() => photos.remove(photoBytes)),
          ),
        ),
      ],
    );
  }

  Widget _selectButton() {
    return Container(
      child: CupertinoButton(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(30)),
          child: Text(
            'Выбрать',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: _selectRandomParticipant,
      ),
    );
  }

  void _selectRandomParticipant() {
    final randomIndex = Random().nextInt(photos.length);

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (ctx) => ResultPage(resultPhoto: photos[randomIndex]),
      ),
    );
  }
}
