import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ModifyPrenotation extends StatefulWidget {
  DocumentSnapshot docToEdit;
  ModifyPrenotation({this.docToEdit});

  @override
  _ModifyPrenotationState createState() => _ModifyPrenotationState();
}

class _ModifyPrenotationState extends State<ModifyPrenotation> {
  TextEditingController classe = TextEditingController();
  TextEditingController stanza = TextEditingController();
  TextEditingController data = TextEditingController();
  TextEditingController ora = TextEditingController();

  final ref = FirebaseFirestore.instance.collection('prenotations');

  @override
  void initState() {
    classe = TextEditingController(text: widget.docToEdit.data()['classe']);
    stanza = TextEditingController(text: widget.docToEdit.data()['stanza']);
    data = TextEditingController(text: widget.docToEdit.data()['data']);
    ora = TextEditingController(text: widget.docToEdit.data()['ora']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference.update({
                  'classe': classe.text,
                  'stanza': stanza.text,
                  'data': data.text,
                  'ora': ora.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Salva')),
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference
                    .delete()
                    .whenComplete(() => Navigator.pop(context));
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
                  decoration: InputDecoration(hintText: 'Data prenotazione'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModifyPrenotationForThisRoom extends StatefulWidget {
  DocumentSnapshot docToEdit;
  ModifyPrenotationForThisRoom({this.docToEdit});

  @override
  _ModifyPrenotationForThisRoomState createState() => _ModifyPrenotationForThisRoomState();
}

class _ModifyPrenotationForThisRoomState extends State<ModifyPrenotationForThisRoom> {
  TextEditingController classe = TextEditingController();
  TextEditingController stanza = TextEditingController();
  TextEditingController data = TextEditingController();
  TextEditingController ora = TextEditingController();

  final ref = FirebaseFirestore.instance.collection('prenotations');

  @override
  void initState() {
    classe = TextEditingController(text: widget.docToEdit.data()['classe']);
    stanza = TextEditingController(text: widget.docToEdit.data()['classe']);
    data = TextEditingController(text: widget.docToEdit.data()['data']);
    ora = TextEditingController(text: widget.docToEdit.data()['ora']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference.update({
                  'classe': classe.text,
                  'stanza': stanza.text,
                  'data': data.text,
                  'ora': ora.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Salva')),
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference
                    .delete()
                    .whenComplete(() => Navigator.pop(context));
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
