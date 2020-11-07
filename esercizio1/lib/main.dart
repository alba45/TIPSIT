import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
//-------------------------------- codice Timer -----------------------//
  int hour = 0;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = true;
  int timefortimer = 0;
  bool checktimer = true;
  String timetodisplay = "00:00:00";

  void start() {
    setState(() {
      started = false;
      stopped = false;
    });

    timefortimer = ((hour * 60 * 60) + (min * 60) + sec);
    Timer.periodic(
        Duration(
          seconds: 1,
        ), (Timer t) {
      setState(() {
        if (timefortimer < 1 || checktimer == false) {
          t.cancel();
          checktimer = true;
          timetodisplay = "00:00:00";
          started = true;
          stopped = true;
//-----------------Reset applicazione---------------------------//
          //  Navigator.pushReplacement(
          //     context,
          //      MaterialPageRoute(
          //       builder: (context) => MyHomePage(),
          //     ));
//--------------------------------------------------------------//
        } else if (timefortimer < 60) {
          if (timefortimer < 10) {
            timetodisplay = "00:00:0" + timefortimer.toString();
          } else {
            timetodisplay = "00:00:" + timefortimer.toString();
          }
          timefortimer = timefortimer - 1;
        } else if (timefortimer < 3600) {
          int m = timefortimer ~/ 60;
          int s = timefortimer - (60 * m);
          if (m < 10 && s < 10) {
            timetodisplay = "00:0" + m.toString() + ":0" + s.toString();
          } else if (m < 10) {
            timetodisplay = "00:0" + m.toString() + ":" + s.toString();
          } else if (s < 10) {
            timetodisplay = "00:" + m.toString() + ":0" + s.toString();
          } else {
            timetodisplay = "00:" + m.toString() + ":" + s.toString();
          }
          timefortimer = timefortimer - 1;
        } else {
          int h = timefortimer ~/ 3600;
          int t = timefortimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          if (h < 10 && m < 10 && s < 10) {
            timetodisplay =
                "0" + h.toString() + ":0" + m.toString() + ":0" + s.toString();
          } else if (m < 10 && s < 10) {
            timetodisplay =
                h.toString() + ":0" + m.toString() + ":0" + s.toString();
          } else if (h < 10 && s < 10) {
            timetodisplay =
                "0" + h.toString() + ":" + m.toString() + ":0" + s.toString();
          } else if (h < 10 && m < 10) {
            timetodisplay =
                "0" + h.toString() + ":0" + m.toString() + ":" + s.toString();
          } else if (s < 10) {
            timetodisplay =
                h.toString() + ":" + m.toString() + ":0" + s.toString();
          } else if (m < 10) {
            timetodisplay =
                h.toString() + ":0" + m.toString() + ":" + s.toString();
          } else if (h < 10) {
            timetodisplay =
                "0" + h.toString() + ":" + m.toString() + ":" + s.toString();
          } else {
            timetodisplay =
                h.toString() + ":" + m.toString() + ":" + s.toString();
          }
          timefortimer = timefortimer - 1;
        }
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stopped = true;
      checktimer = false;
    });
  }

  Widget countdown() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Text(
                      "HH",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  NumberPicker.integer(
                    initialValue: hour,
                    minValue: 0,
                    maxValue: 23,
                    listViewWidth: 60.0,
                    onChanged: (val) {
                      setState(() {
                        hour = val;
                      });
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Text(
                      "MM",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  NumberPicker.integer(
                    initialValue: min,
                    minValue: 0,
                    maxValue: 60,
                    listViewWidth: 60.0,
                    onChanged: (val) {
                      setState(() {
                        min = val;
                      });
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Text(
                      "SS",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  NumberPicker.integer(
                    initialValue: sec,
                    minValue: 0,
                    maxValue: 60,
                    listViewWidth: 60.0,
                    onChanged: (val) {
                      setState(() {
                        sec = val;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            timetodisplay,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 35.0,
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: started ? start : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10,
                  ),
                  color: Colors.green,
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                RaisedButton(
                  onPressed: stopped ? null : stop,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10,
                  ),
                  color: Colors.red,
                  child: Text(
                    "Stop",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ],
            )),
      ],
    ));
  }
  //===================== codice Cronometro =======================//

  bool startispressed = false;
  bool stopispressed = true;
  bool resetispressed = true;
  bool stopflag = false;
  bool resetfalg = false;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  void startCronometro() {
    setState(() {
      startispressed = true;
      stopispressed = false;
      resetispressed = true;
    });
  }

  void stopCronometro() {
    setState(() {
      stopispressed = true;
      resetispressed = false;
      startispressed = false;
    });
  }

  void resetCronometro() {
    setState(() {
      stopispressed = true;
      startispressed = false;
      resetispressed = true;
    });
  }

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void resetTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!stopflag) {
        while (stopflag == true) {}
      } else if (resetfalg = true) {
        resetTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: resetTimer,
      onResume: startTimer,
      onPause: resetTimer,
    );

    return streamController.stream;
  }

  Widget cronometrostream() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "$hoursStr:$minutesStr:$secondsStr",
                style: TextStyle(
                  fontSize: 90.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: stopispressed
                            ? null
                            : () {
                                stopflag = true;
                                stopCronometro();
                              },
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 15.0,
                        ),
                        color: Colors.red,
                        child: Text(
                          "Stop",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: resetispressed
                            ? null
                            : () {
                                resetfalg = true;
                                resetCronometro();
                                timerSubscription.cancel();
                                timerStream = null;
                                setState(() {
                                  hoursStr = '00';
                                  minutesStr = '00';
                                  secondsStr = '00';
                                });
                              },
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 15.0,
                        ),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: startispressed
                        ? null
                        : () {
                            stopflag = false;
                            startCronometro();
                            timerStream = stopWatchStream();
                            timerSubscription =
                                timerStream.listen((int newTick) {
                              setState(() {
                                hoursStr = ((newTick / (60 * 60)) % 60)
                                    .floor()
                                    .toString()
                                    .padLeft(2, '0');
                                minutesStr = ((newTick / 60) % 60)
                                    .floor()
                                    .toString()
                                    .padLeft(2, '0');
                                secondsStr = (newTick % 60)
                                    .floor()
                                    .toString()
                                    .padLeft(2, '0');
                              });
                            });
                          },
                    padding: EdgeInsets.symmetric(
                      horizontal: 80.0,
                      vertical: 20.0,
                    ),
                    color: Colors.green,
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
//------------------------------ Layout ---------------------------//

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
      backgroundColor: Colors.blueGrey[900], //impostiamo il colore dello sfondo
      appBar: AppBar(
        //usiamo un AppBar
        title: Text(
          //chiamata TimeProject
          "Time Project",
        ),
        centerTitle: true, //centriamo il titolo
        bottom: TabBar(
          //e nell'AppBar mettiamo
          tabs: <Widget>[
            //una TabBar con
            Text("Timer"), //le opzioni di scelta
            Text("Cronometro"), //Timer, Cronometro
          ],
          labelPadding: EdgeInsets.only(
            bottom: 18.0, //la distanza dal fondo della AppBar
          ),
          labelStyle: TextStyle(
            fontSize: 20.0, //impostiamo la grandezzza del testo
          ),
          unselectedLabelColor: Colors.white,
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[//qui richiamiamo le pagine
          countdown(), //che appariranno in base
          cronometrostream(), //alla barra selezionata
        ],
        controller: tb, //controller della TabBar
      ),
    );
  }
}
