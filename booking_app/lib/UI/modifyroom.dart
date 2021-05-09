import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModifyRoom extends StatefulWidget {
  DocumentSnapshot docToEdit;
  ModifyRoom({this.docToEdit});

  @override
  _ModifyRoomState createState() => _ModifyRoomState();
}

class _ModifyRoomState extends State<ModifyRoom> {
  TextEditingController nome = TextEditingController();
  TextEditingController tipo = TextEditingController();

  @override
  void initState() {
    nome = TextEditingController(text: widget.docToEdit.data()['nome']);
    tipo = TextEditingController(text: widget.docToEdit.data()['tipo']);
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
                  'nome': nome.text,
                  'tipo': tipo.text,
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
                controller: tipo,
                decoration: InputDecoration(
                    hintText: 'Tipo di stanza (esempio: Laboratorio))'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    controller: nome,
                    decoration: InputDecoration(
                        hintText: 'Nome della stanza (esempio: LLM))'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
