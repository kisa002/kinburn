import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:core';
import 'package:custom_switch/custom_switch.dart';

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
  final int GENDER_MALE = 1;
  final int GENDER_FEMALE = 2;

  final _appbarColor = const Color(0xff353641);

  final _textColor = const Color(0xff565869);
  final _textGrayColor = const Color(0xffBDBDC4);
  final _textSwiperSecondColor = const Color(0xffC2C2C9);
  final _textSwiperThirdColor = const Color(0xffEAEBED);

  final _whiteColor = const Color(0xffffffff);
  final _backgroundColor = const Color(0xffeff1f9);
  final _primaryColor = const Color(0xff576EE7);

  final double _radius = 20;

  int _gender = 1;

  int _age = 20;
  int _weight = 50;

  int _height = 169;

  bool _isInit = false;
  bool _isShowResult = false;

  double _bmi = 0;
  String _bmiRange = 'Normal';

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
      body: Stack(
        children: <Widget>[
          Container(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text('Age', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: _textColor)),
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
                                Text('Weight', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: _textColor)),
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
                          Text('Height', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: _textColor)),
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
                                itemCount: 220,
                                viewportFraction: _height <= 100 ? 0.2 : 0.2,
  //                            scale: -1,
                                onIndexChanged: (int index) {
                                  setState(() {
                                    // TODO 나중에 결과 값에 +1 해줘야함
                                    _height = index;
                                  });
                                },
                                itemBuilder: (BuildContext context, int index){
                                  double fontSize = index <= 100 ? 20 : 8;

                                  Color color = _textSwiperThirdColor;
                                  int x = (_height - index).abs();

                                  print('index: $index');

                                  if(x == 0) {
                                    fontSize += 35;
                                    color = _textColor;
                                  }
                                  else if(x == 1) {
                                    if(index > 100)
                                      fontSize += 18;
                                    else
                                      fontSize += 10;

                                    color = _textSwiperSecondColor;
                                  }
                                  else if(x == 2) {
                                    if(index > 100)
                                      fontSize += 10;
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
  //                      Text('$_height'),
                          SizedBox(
                            height: 10
                          ),
                          SizedBox(
                            width: 10,
                            height: 7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100)
                              ),
                              child: Container(
                                color: _primaryColor,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.white, Color(0xffECECEC)]
                                  ),
                                ),
                                child: SizedBox(
                                  width: 150,
                                  height: 2,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Color(0xffECECEC), Colors.white]
                                  ),
                                ),
                                child: SizedBox(
                                  width: 150,
                                  height: 2,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 300,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: _createRuler()
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(_radius),
                  child: SizedBox(
                    width:  375,
                    height: 120,
                    child: Container(
                      color: _whiteColor,
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text('Gender', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: _textColor)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text('i\'m', style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold, color: _textColor)),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text('Female', style: TextStyle(fontSize: 17, color: _textColor))
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 85,
                                height: 35,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: MaterialButton(
                                    onPressed: () => {
                                      setState(() => {
                                        _gender = _gender == GENDER_FEMALE ? GENDER_MALE : GENDER_FEMALE
                                      })
                                    },
                                    padding: EdgeInsets.all(0),
                                    child: SizedBox(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Color(_gender == GENDER_FEMALE ? 0xffFFA7A7 : 0xffA7B1FF),
                                          child: AnimatedContainer(
                                              duration: Duration(seconds: 12),
                                              curve: Curves.fastOutSlowIn,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(_gender == GENDER_MALE ? 40 : 0, 0, _gender == GENDER_FEMALE ? 40 : 0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: SizedBox(
                                                    width: 28,
                                                    height: 28,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(_gender == GENDER_FEMALE ? 0xffFFE8E8 : 0xffE8F4FF),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text('Male', style: TextStyle(fontSize: 17, color: _textColor))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 250,
                  height: 42,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () => showResultDialog(),
                      color: _primaryColor,
                      child: Text('BMI Calculate', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: _isShowResult,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Color(0x30000000),
                ),
                Dialog(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    width: 320,
                    height: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white,
//                  padding: EdgeInsets.all(50),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 70),
                            Text('$_bmi', style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Color(0xff545667))),
                            SizedBox(height: 10),
                            Text('$_bmiRange', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff545667))),
                            SizedBox(height: 50),
                            SizedBox(
                              width: 170,
                              height: 35,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: MaterialButton(
                                  onPressed: () => hideResultDialog(),
                                  color: _primaryColor,
                                  padding: EdgeInsets.all(0),
                                  child: Text('OK', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ]
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

  List<Widget> _createRuler() {
    List<Widget> list = new List<Widget>();

    for(int i=1; i<50; i++) {
      // 0xffececec
      // 0xff25aaff
      if(i % 5 == 0) {
        list.add(new SizedBox(
          width: 2,
          height: 13,
          child: Container(
            color: Color(0xffececec),
          ),
        ));
      } else {
        list.add(new SizedBox(
          width: 1,
          height: 13,
          child: Container(
            color: Color(0xffececec),
          ),
        ));
      }
    }

    return list;
  }

  void showResultDialog() {
    setState(() {
      _isShowResult = true;
      _bmi = _weight / ((_height + 1) * 0.01 * (_height + 1) * 0.01);
      _bmi = double.parse(_bmi.toStringAsFixed(2));

      _bmiRange = _bmi <= 18.5 ? 'Underweight' : _bmi <= 23 ? 'Normal' : _bmi <= 25 ? 'Overweight' : _bmi <= 30 ? 'Obesity' : 'Pig';
    });
  }

  void hideResultDialog() {
    setState(() {
      _isShowResult = false;
    });
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
