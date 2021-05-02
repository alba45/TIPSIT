
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memo_app/UI/modifyprenotation.dart';

class LookPrenotations extends StatefulWidget {
  // DocumentSnapshot docToEdit;
  // LookPrenotations({this.docToEdit});

  @override
  _LookPrenotationsState createState() => _LookPrenotationsState();
}

class _LookPrenotationsState extends State<LookPrenotations> {
  // TextEditingController title = TextEditingController();
  // TextEditingController content = TextEditingController();

  @override
  void initState() {
    // title = TextEditingController(text: widget.docToEdit.data()['title']);
    //  content = TextEditingController(text: widget.docToEdit.data()['content']);
    super.initState();
  }

/* *************** START ***************** */
  final List<int> colorCodes = <int>[50, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "Booking room",
        ),
      ),
      body: Container(
        child: ConstrainedBox(
            constraints: new BoxConstraints(),
            child: Row(
              children: <Widget>[
                Expanded(child: _listBuilder()),
              ],
            )),
      ),
    );
  }

// The ListView.builder constructor takes an IndexedWidgetBuilder, which builds the children on demand.

  Widget _listBuilder() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 24,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ModifyPrenotation(index)));
            },
            child: Container(
              height: 100,
              color: Colors.amber[colorCodes[index % 2]],
              child: Center(child: Text('$index ora:')),
            ),
          );
        });
  }
}

/* ********************************************* END*********************************************** */
/*  





 floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              this.context, MaterialPageRoute(builder: (_) => AddRoom()));
        },
      ),






@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference.updateData({
                  'tipo': title.text,
                  'nome': content.text,
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
                decoration: InputDecoration(hintText: 'Tipo stanza'),
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
                  decoration: InputDecoration(hintText: 'Nome stanza'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
