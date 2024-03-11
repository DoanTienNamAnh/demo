import 'dart:convert';

import 'package:complycube/complycube_widget.dart';
import 'package:demo/app_routes.dart';
import 'package:demo/navigation_config.dart';
import 'package:demo/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BehaviorSubject<String> _tokenSubject = BehaviorSubject<String>();

  final stages = [
    {
      "name": 'intro',
      "heading": 'Green Bank ID verification',
    },
    // {
    //   "name": 'documentCapture',
    //   "showGuidance": true,
    //   "useMLAssistance": true,
    //   "retryLimit": 1,
    //   "liveCapture": true,
    //   "documentTypes": {
    //     "passport": true,
    //     "driving_license": ['GB', 'FR'],
    //     "national_identity_card": true
    //   },
    // },
    'faceCapture',
  ];

  late Map<String, dynamic> _settings;

  void _createToken() async {
    try {
      var headers = {
        'Authorization':
            'test_QXpoeUR0aTl1aFMzYlJmejk6OWY5YzBkMmQ1NjYxNTEzMjllOTI5Yjk1YzVhM2ZkYWIxYWVkNzhmMzNiNWE2ODZhYTU4NWRhNWY5NDJiNTBkZA==',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST', Uri.parse('https://api.complycube.com/v1/tokens'));
      request.body = json.encode({
        "clientId": "65a5e9b3a333ce00082eaf14",
        "appId": "com.example.demo"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        var token = jsonDecode(result)["token"];
        _settings = {
          "clientID": "65a5e9b3a333ce00082eaf14",
          "clientToken": token,
          "stages": stages,
          "lookAndFeel": {
            "primaryButtonBorderColor": "0xffEDB836",
            "primaryButtonBgColor": "0xffEDB836",
            "headingTextColor": "0xffEDB836",
            "borderRadius": 24
          }
          // ...
        };
        _tokenSubject.add(token);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _createToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComplyCube Integration'),
      ),
      body: StreamBuilder<String>(
          stream: _tokenSubject,
          builder: (_, snapshot) {
            return snapshot.hasData
                ? ComplyCubeWidget(
                    settings: _settings,
                    onSuccess: (result) {
                        showDialog(context: context, builder: (context) => const AlertDialog(content: Text("Success"),));
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
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
