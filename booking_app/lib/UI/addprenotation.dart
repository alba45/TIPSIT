import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPrenotation extends StatelessWidget {
  TextEditingController classe = TextEditingController();
  TextEditingController stanza = TextEditingController();
  TextEditingController data = TextEditingController();
  TextEditingController ora = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('prenotations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                ref.add({
                  'classe': classe.text,
                  'stanza': stanza.text,
                  'data': data.text,
                  'ora': ora.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Salva')),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: ora,
                decoration: InputDecoration(hintText: 'ora'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: classe,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'classe'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: stanza,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'stanza'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: data,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'data da prenotare'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
