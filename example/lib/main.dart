import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fluttertesting/fluttertesting.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _DownloadsPath = 'UNKNOWN';

  @override
  void initState() {
    super.initState();
  }

  _getDownloadsPath() async{
    String path = await Fluttertesting.getDownloadsDirPath;
    if(mounted){
      setState(() {
        _DownloadsPath = path;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Downloads Path Provider'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _DownloadsPath,
                style: Theme.of(context).textTheme.title,
              ),
              RaisedButton(
                onPressed: () => _getDownloadsPath(),
                child: Text("Get Downloads Path"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
