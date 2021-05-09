import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddRoom extends StatelessWidget {
  TextEditingController nome = TextEditingController();
  TextEditingController tipo = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('aule');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                ref.add({
                  'nome': nome.text,
                  'tipo': tipo.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Salva'))
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
