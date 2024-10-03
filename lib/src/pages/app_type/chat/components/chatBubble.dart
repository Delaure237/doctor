// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../shared/constant/constant.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key, 
    required this.message, 
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrentUser ? primaryColor :  const Color(0xfff1f1f1),
        borderRadius: BorderRadius.only(
          topLeft:  const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isCurrentUser ? const Radius.circular(12) : Radius.zero/2.0, 
          bottomRight: isCurrentUser ? Radius.zero/2.0 : const Radius.circular(12),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(color: isCurrentUser ? bgColor : Colors.black),
      ),
    );
  }
}
