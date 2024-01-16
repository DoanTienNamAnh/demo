import 'package:complycube/complycube_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final stages = [
    {
      "name": 'intro',
      "heading": 'Green Bank ID verification',
    },
    {
      "name": 'documentCapture',
      "showGuidance": false,
      "useMLAssistance": true,
      "retryLimit": 1,
      "documentTypes": {
        "passport": true,
        "driving_license": ['GB', 'FR'],
        "national_identity_card": true
      },
    },
    'faceCapture',
  ];

  late Map<String, dynamic> _settings;

  @override
  void initState() {
    _settings = {
      "clientID": "65a5e9b3a333ce00082eaf14",
      "clientToken":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjoiTXpCak16TTVZVEJoTlRReU56ZzFOVGRpT1Rka1ltTTJObVV3Wm1Zd05ERTBObUk0WWpVMU1URmlZMkkzTjJKbFlUYzVNek5tWXpjd1pEUXdOREppTXpkbVpXTTVaR0ppTkdVMFkyTXdNMkpoTkdWaU1URmlaakZtTmpVeVpUbGxORFZtTURrNE9EZ3dOMk5rTjJVek9UWXpObUUwTTJaaVlqUXpPRFUzTm1VeVpqUTFOMkV6T1RKbVltTm1ZV0UzT0RVeE5tTTFNemd4T0dWallUQmpaalppWXpaa01tUTJaV0ptTVRKbU9USmpZV1UwWmpoa05qazNPV1kyT1RBek5qVXdaVGhoWldVek1qWTROR0kwTWpRek1EZzJaalV3T0Rrek9UTmpaRFU0WVRKak5qWXpZMlEwTnpZME1qYzVNVEUwTkdSbVlqSmhNR0V3WXpnM053PT0iLCJ1cmxzIjp7ImFwaSI6Imh0dHBzOi8vYXBpLmNvbXBseWN1YmUuY29tIiwic3luYyI6IndzczovL3hkcy5jb21wbHljdWJlLmNvbSIsImNyb3NzRGV2aWNlIjoiaHR0cHM6Ly94ZC5jb21wbHljdWJlLmNvbSJ9LCJvcHRpb25zIjp7ImhpZGVDb21wbHlDdWJlTG9nbyI6ZmFsc2UsImVuYWJsZUN1c3RvbUxvZ28iOnRydWUsImVuYWJsZVRleHRCcmFuZCI6dHJ1ZSwiZW5hYmxlQ3VzdG9tQ2FsbGJhY2tzIjp0cnVlLCJlbmFibGVOZmMiOmZhbHNlLCJpZGVudGl0eUNoZWNrTGl2ZW5lc3NBdHRlbXB0cyI6NSwiZG9jdW1lbnRJbmZsaWdodFRlc3RBdHRlbXB0cyI6MiwibmZjUmVhZEF0dGVtcHRzIjo1fSwiaWF0IjoxNzA1Mzg1MjA1LCJleHAiOjE3MDUzODg4MDV9.ljZP7zaukXxrOQ7LoxDyGas2aSSAL6KwwjXDnlBKAnQ",
      "stages": stages,
      // ...
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ComplyCube Integration'),
        ),
        body: ComplyCubeWidget(
          settings: _settings,
          onSuccess: (result) {
            if (kDebugMode) {
              print(result);
            }
          },
          onCancelled: (result) {
            if (kDebugMode) {
              print(result);
            }
          },
          onError: (error) {
            if (kDebugMode) {
              print(error);
            }
          },
          onComplyCubeEvent: (event) {
            print(event);
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
