import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Masa Subur',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Kalkulator Masa Subur'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DateTime hariIni = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime perkiraanOvulasi =DateTime.now();
  DateTime masaSuburAwal =DateTime.now();
  DateTime masaSuburAkhir =DateTime.now();
  DateTime haidBerikutnya =DateTime.now();

  String convertToString(dateTime) {

    return '${dateTime.toLocal()}'.split(" ")[0];
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        perkiraanOvulasi = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 14);
        masaSuburAwal = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 10);
        masaSuburAkhir = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 18);
        haidBerikutnya = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 28);
      });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Hari ini'),
              Text(convertToString(hariIni),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Divider(height: 24.0,),
              Text('Hari Pertama haid terakhir anda'),
              Text(convertToString(selectedDate),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Divider(height: 24.0,),
              Row(
                children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Perkiraan ovulasi'),
                      Text(
                        convertToString(perkiraanOvulasi),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                    ],
                  ),
                ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Haid anda berikutnya'),
                        Text(convertToString(haidBerikutnya),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                      ],
                    ),
                  ),

              ],
              ),
              Divider(height: 24.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Masa Subur'),
                        Text(convertToString(masaSuburAwal) + ' - ' + convertToString(masaSuburAkhir),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                        )

                      ],
                    ),
                  ),

                ],
              ),
              Divider(height: 24.0,),
              RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text('Kapan Hari pertama haid terakhir Anda?'),
              ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
            ],
          ),
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
