import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModifyMemo extends StatefulWidget {
  DocumentSnapshot docToEdit;
  ModifyMemo({this.docToEdit});

  @override
  _ModifyMemoState createState() => _ModifyMemoState();
}

class _ModifyMemoState extends State<ModifyMemo> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docToEdit.data()['title']);
    content = TextEditingController(text: widget.docToEdit.data()['content']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference.updateData({
                  'title': title.text,
                  'content': content.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Salva')),
              FlatButton(
              onPressed: () {
                widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));
              },
              child: Text('Delete'))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(hintText: 'Titolo'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Contenuto'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
