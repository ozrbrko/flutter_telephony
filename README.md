# flutter_telephony

get telephony info：

Android:based on TelephonyManager

iOS：based on [CoreTelephony](https://developer.apple.com/documentation/coretelephony)


## ENGLISH    |     [中文](https://github.com/RandyWei/flutter_telephony/blob/master/README_CN.md)

## Installation
```
//pub
dependencies:
  flutter_telephony: any

//import
dependencies:
  flutter_telephony:
    git:
      url: git://github.com/RandyWei/flutter_telephony.git
```

## Android

  cellInfo

  Requires permission:android.permission.ACCESS_FINE_LOCATION

  dataNetworkType

  Requires permission:android.permission.READ_PHONE_STATE


  deviceSoftwareVersion

  Requires permission:android.permission.READ_PHONE_STATE


  IMEI(International Mobile Equipment Identity)（imei）

  Requires permission:android.permission.READ_PHONE_STATE



  isDataEnabled

  Requires one of the following permissions:

  android.permission.ACCESS_NETWORK_STATE

  android.permission.MODIFY_PHONE_STATE


  line1Number

  Requires one of the following permissions:

  android.permission.READ_PHONE_STATE

  android.permission.READ_SMS

  android.permission.READ_PHONE_NUMBERS



  MEID (Mobile Equipment Identifier)（meid）

  Requires permission:android.permission.READ_PHONE_STATE


  Network Access Identifier (NAI)

  Requires permission:android.permission.READ_PHONE_STATE

```xml
<manifest
    ...
    xmlns:tools="http://schemas.android.com/tools" >
    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    <uses-permission android:name="android.permission.MODIFY_PHONE_STATE"/>
    <uses-permission android:name="android.permission.READ_SMS"/>
    <uses-permission android:name="android.permission.READ_PHONE_NUMBERS"/>
    ...
</manifest>
```

## iOS

Getting Information About the Cellular Service Provider

var allowsVOIP: Bool

Indicates if the carrier allows making VoIP calls on its network.

var carrierName: String?

The name of the user’s home cellular service provider.

var isoCountryCode: String?

The ISO country code for the user’s cellular service provider.

var mobileCountryCode: String?

The mobile country code (MCC) for the user’s cellular service provider.

var mobileNetworkCode: String?

The mobile network code for the user’s cellular service provider.

## Example

```dart
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
      info = await FltFlutterTelephony.info;
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
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Phone Number: ${_info?.line1Number}\n'),
        ),
      ),
    );
  }
}

```

## Other
[Home Page](https://www.bughub.dev)

[Video Player Based On TxVodPlayer](https://pub.flutter-io.cn/packages/flt_video_player)