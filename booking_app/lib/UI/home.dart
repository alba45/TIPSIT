import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'prenotations.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  final ref1 = FirebaseFirestore.instance.collection('prenotazioni');

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          "Booking room",
        ),
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
                              builder: (_) => LookPrenotations()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 150,
                      color: Colors.grey[200],
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.data.docs[index].data()['tipo'] + ":",
                          style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                          ),
                        ),
                          Text(snapshot.data.docs[index].data()['nome'],
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
          }),
    );
  }
}
