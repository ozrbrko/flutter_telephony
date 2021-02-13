import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_telephony/flutter_telephony.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterTelephony _info;

  @override
  void initState() {
    super.initState();
    getFlutterTelephony();
  }

  Future<void> getFlutterTelephony() async {
    FlutterTelephony info;
    try {
      info = await FlutterTelephonyInfo.get;
    } on PlatformException {}

    if (!mounted) return;

    setState(() {
      _info = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Telephony example'),
        ),
        body: ListView(
          children: [
            Center(
              child: Text(_info.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
