import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:core';
import 'dart:math';

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
  final _textGrayColor = const Color(0xffBDBDC4);
  final _textSwiperSecondColor = const Color(0xffC2C2C9);
  final _textSwiperThirdColor = const Color(0xffEAEBED);

  final _whiteColor = const Color(0xffffffff);
  final _backgroundColor = const Color(0xffeff1f9);
  final _primaryColor = const Color(0xff576EE7);

  final double _radius = 20;

  int _age = 20;
  int _weight = 50;

  int _height = 170;

  bool _isInit = false;

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
                      borderRadius: BorderRadius.circular(_radius),
                      child: Container(
                          color: _whiteColor,
//                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text('Age', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _textColor)),
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
                      borderRadius: BorderRadius.circular(_radius),
                      child: Container(
                          color: _whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text('Weight', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _textColor)),
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
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width:  375,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_radius),
                child: Container(
                  color: _whiteColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text('Height', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _textColor)),
                      SizedBox(
                        height: 3,
                      ),
                      Text('cm', style: TextStyle(fontSize: 15, color: _textGrayColor)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Swiper(
                            index: _height,
                            itemCount: 180,
                            viewportFraction: _height <= 100 ? 0.2 : 0.3,
//                            scale: -1,
                            onIndexChanged: (int index) {
                              if(_isInit) {
                                _height = index;
                              } else {
                                _height = index;
                                _isInit = true;
                              }
                            },
                            itemBuilder: (BuildContext context, int index){
                              double fontSize = index <= 100 ? 20 : 10;

                              Color color = _textSwiperThirdColor;
                              int x = (_height - index).abs();

                              print('index: $index');

                              if(x == 0) {
                                fontSize += 35;
                                color = _textColor;
                              }
                              else if(x == 1) {
                                fontSize += 10;
                                color = _textSwiperSecondColor;
                              }
                              else if(x == 2) {
//                                fontSize = 20;
                                color = _textSwiperThirdColor;
                              }

                              return Container(
                                alignment: Alignment.center,
                                child: Text('${index + 1}', style: TextStyle(fontSize: fontSize, color: color))
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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

  void swipeWeight(int weight) {
    print('weight: $weight');
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
