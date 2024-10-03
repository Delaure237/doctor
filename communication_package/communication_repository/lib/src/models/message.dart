// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../communication_repository.dart';

class Message  extends Equatable{

  final String senderId;

  final String receiverId;
  final String message;
  final Timestamp timestamp;

 const  Message({
    required this.senderId, 
    required this.receiverId, 
    required this.message, 
    required this.timestamp
    });
 //definir un objet vide 
 static final empty = Message(
  senderId: "", 
  receiverId: "", 
  message: "", 
  timestamp:Timestamp.now()
  );


Message CopyWith({
  String ?senderId,
  String ? receverId,
  String?message,
  Timestamp ? timestamp
}){
  return Message(
    senderId: senderId ?? this.senderId, 
    receiverId: receiverId, 
    message: message ?? this.message, 
    timestamp: Timestamp.now()
    );
}
  
       

 MessageEntity toEntity(){
  return MessageEntity(
    senderId: senderId, 
    receiverId: receiverId, 
    message: message, 
    timestamp: timestamp
    );
 }
  
  static Message fromEntity(MessageEntity entity){
    return Message(
      senderId: entity.senderId, 
      receiverId: entity.receiverId, 
      message: entity.message, 
      timestamp: entity.timestamp
      );
  }
  @override

  List<Object?> get props => [senderId,receiverId,message,timestamp];

  
    }
 
