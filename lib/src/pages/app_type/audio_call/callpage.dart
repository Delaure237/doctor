// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

//import 'package:agora_rtc_engine/rtc_local_view ' as rtc_local_view;
class CallPage extends StatefulWidget {

  const CallPage({super.key, });

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final users = <int>[];
  final  _infoStrings = <String>[];
  bool muted = false;
  bool viewPanel = false;
  late RtcEngine _engine;
  @override
  void initState(){
    super.initState();
    initialize();
     }
     @override
     void dispose() {
      users.clear();
      _engine.leaveChannel();
      _engine.release();
      super.dispose();
     }
     Future<void> initialize() async {

     }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}