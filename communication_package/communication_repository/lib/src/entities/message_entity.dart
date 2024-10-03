// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
    final String senderId;

  final String receiverId;
  final String message;
  final Timestamp timestamp;

  const MessageEntity({
   required  this.senderId, 
  required    this.receiverId, 
  required   this.message,
  required this.timestamp, 

  });



  Map<String, Object?> toDocument() {
    return{
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }

static MessageEntity fromDocument(Map<String, dynamic> doc) {
    return MessageEntity(
      senderId:doc['senderId'] ,
      receiverId: doc['receiverId'] ,
      message: doc['message'] ,
      timestamp: doc['timestamp']
    );
  }
  
  @override

  List<Object?> get props =>[senderId,receiverId,message,timestamp];

}
