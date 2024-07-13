
import 'package:doctor/src/pages/shared_between_pages/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget{
  const Message({super.key});

  @override
  CalendarState createState() => CalendarState();
}
class CalendarState extends State<Message>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:Header(context, "Message")
    );
  }
}