import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() async {
  Socket sock = await Socket.connect('10.0.2.2', 3000);
  runApp(MyApp(sock));
}

class MyApp extends StatelessWidget {
  Socket socket;

  MyApp(Socket s) {
    this.socket = s;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: 'Scoket',
        channel: socket, 
        
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Socket channel;

  MyHomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController controllertext = TextEditingController();
  List<String> testo = List<String>();
  String nome = "";
  String x="";
  bool registrato = false;
  String lastrecived="";
  String lastsent="";
  String txt= 'Scrivi un messaggio';
  bool issending=false;

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return registrato == true
        ? Scaffold(
            appBar: AppBar(
              title: Text("ChatSocket"),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-1.0, 0.98),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Form(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.78,
                            child: TextFormField(
                              controller: controllertext,
                              decoration: InputDecoration(
                                  hintText: txt,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0))),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: FloatingActionButton(
                            onPressed: () {
                              sendMessage();
                            },
                            tooltip: 'Invio',
                            child: Icon(Icons.send),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.98,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: StreamBuilder(
                          stream: widget.channel,
                          builder: (context, snapshot) {
                            if(snapshot.data != null && lastrecived!=String.fromCharCodes(snapshot.data)) {
                              //print(String.fromCharCodes(snapshot.data));
                              //print("xonsnap= "+x);
                              visualizza(String.fromCharCodes(snapshot.data));
                                    }else{ visualizza("No messages");
                            }
                            return Container(
                              child: Text(
                                x,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            );
                            },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(""),
            ),
            body: Center(
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment(0.0, -0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Entra nella chat",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      child: TextField(
                        controller: myController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Inserisci il nome",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.8, 0.9),
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        iconSize: 60,
                        color: Colors.white,
                        onPressed: () {
                          if (myController.text != "") {
                            print(myController.text);
                            setState(() {
                              nome =(myController.text);
                              registrato = true;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1, 0.98),
                    child: IconButton(
                      icon: Icon(Icons.info_outline),
                      iconSize: 40,
                      color: Colors.black,
                      onPressed: () {
                        alert();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  alert() {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Cosa serve il login?",
        textAlign: TextAlign.center,
      ),
      content: Text(
        "Questo è il nome che gli altri utenti visualizzeranno",
        textAlign: TextAlign.center,
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

 void visualizza(String app) {
    //print("ltvisualizza=" + lastrecived);
    //print("appvisualizza=" + app);
    if(app!="No messages" && issending!=true && lastrecived!=app){
      lastrecived = app;
      testo.add(app);
        x = '';
        for (int i = 0; i < testo.length; i++) {
          x += testo[i] + "\n";
        }
    } else {
          x = '';
        for (int i = 0; i < testo.length; i++) {
          x += testo[i] + "\n";
        }
    }
    issending=false;
   // print("xaftervisualizza= "+x);
  }

  void sendMessage() {
   // print("x1send= "+x);
    issending=true;
    if (controllertext.text.isNotEmpty) {
      widget.channel.write(nome + ': ' + controllertext.text);
      lastsent = nome + ': ' + controllertext.text;
      testo.add(nome + ': ' + controllertext.text);
      controllertext.clear();
      setState(() {
        x = '';
        for (int i = 0; i < testo.length; i++) {
          x += testo[i] + "\n";
        }
        //print("x2send= "+x);
      });
    }
  }

  @override
  void dispose() {
    widget.channel.close();
    super.dispose();
  }
}
