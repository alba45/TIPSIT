import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memo_app/UI/addprenotation.dart';
import 'addroom.dart';
import 'modifyprenotation.dart';
import 'modifyroom.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final ref = FirebaseFirestore.instance.collection('aule');
  final ref2 = FirebaseFirestore.instance.collection('prenotations');

  Widget aule() {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddRoom()));
          },
        ),
        body: StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ModifyRoom(
                                      docToEdit: snapshot.data.docs[index],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 150,
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data.docs[index].data()['tipo'] + ":",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data.docs[index].data()['nome'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }

  Widget prenotazioni() {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddPrenotation()));
        },
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

  final List<int> colorCodes = <int>[50, 100];

  Widget _listBuilder() {
    return StreamBuilder(
        stream: ref2.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ModifyPrenotation(
                                  docToEdit: snapshot.data.docs[index],
                                )));
                  },
                  child: Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index % 2]],
                    child: Center(
                      child: Column(
                        children: [
                          Text(snapshot.data.docs[index]
                                  .data()['ora']
                                  .toString() +
                              '° ora ' +
                              '| classe: ' +
                              snapshot.data.docs[index]
                                  .data()['classe']
                                  .toString()),
                          Text('stanza: ' +
                              snapshot.data.docs[index]
                                  .data()['stanza']
                                  .toString() +
                              ' | data prenotazione: ' +
                              snapshot.data.docs[index]
                                  .data()['data']
                                  .toString()),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  TabController tb;

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          "Booking App",
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: <Widget>[
            Text("aule"),
            Text("prenotazioni"),
          ],
          labelPadding: EdgeInsets.only(
            bottom: 18.0,
          ),
          labelStyle: TextStyle(
            fontSize: 20.0,
          ),
          unselectedLabelColor: Colors.white,
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          aule(),
          prenotazioni(),
        ],
        controller: tb,
      ),
    );
  }
}
