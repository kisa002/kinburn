import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: KinBurn(),
    );
  }
}

class KinBurn extends StatefulWidget {
  @override
  _KinBurnState createState() => _KinBurnState();
}

class _KinBurnState extends State<KinBurn> {
  final _appbarColor = const Color(0xff353641);
  final _textColor = const Color(0xff565869);
  final _whiteColor = const Color(0xffffffff);
  final _backgroundColor = const Color(0xffeff1f9);
  final _primaryColor = const Color(0xff576EE7);

  int _age = 20;
  int _weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text('BMI CALCULATOR', style: TextStyle(color: _appbarColor, fontWeight: FontWeight.bold)),
        ),
        elevation: 0,
        backgroundColor: _whiteColor,
      ),
      body: Container(
        color: _backgroundColor,
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                    width: 350/2,
                    height: 400/2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          color: _whiteColor,
//                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text('Age', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _textColor)),
                              SizedBox(
                                height: 20,
                              ),
                              Text('$_age', style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: _textColor)),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ButtonTheme(
                                      minWidth: 35,
                                      height: 35,
                                      child: MaterialButton(
                                        color: _whiteColor,
                                        onPressed: () => _decreaseAge(),
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(0),
                                        elevation: 2,
                                        child: Icon(Icons.remove, color: _primaryColor),
                                      )
                                  ),
                                  ButtonTheme(
                                      minWidth: 35,
                                      height: 35,
                                      child: MaterialButton(
                                        color: _whiteColor,
                                        onPressed: () => _increaseAge(),
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(0),
                                        elevation: 2,
                                        child: Icon(Icons.add, color: _primaryColor),
                                      )
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                    )
                ),
                SizedBox(
                    width: 350/2,
                    height: 400/2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          color: _whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text('Weight', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _textColor)),
                              SizedBox(
                                height: 20,
                              ),
                              Text('$_weight', style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: _textColor)),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ButtonTheme(
                                      minWidth: 35,
                                      height: 35,
                                      child: MaterialButton(
                                        color: _whiteColor,
                                        onPressed: () => _decreaseWeight(),
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(0),
                                        elevation: 2,
                                        child: Icon(Icons.remove, color: _primaryColor),
                                      )
                                  ),
                                  ButtonTheme(
                                      minWidth: 35,
                                      height: 35,
                                      child: MaterialButton(
                                        color: _whiteColor,
                                        onPressed: () => _increaseWeight(),
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(0),
                                        elevation: 2,
                                        child: Icon(Icons.add, color: _primaryColor),
                                      )
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                    )
                )
              ],
            )
          ],
        ),
      )
    );
  }

  void showMessage(String msg) {
    print(msg);
//    final snackbar = SnackBar(content: Text(msg));
//
//    Scaffold.of(ctx)
//      ..removeCurrentSnackBar()
//      ..showSnackBar(snackbar);
  }

  void _decreaseAge() {
    setState(() {
      _age--;
    });
  }

  void _increaseAge() {
    setState(() => _age++);
  }

  void _decreaseWeight() {
    setState(() {
      _weight--;
    });
  }

  void _increaseWeight() {
    setState(() => _weight++);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
