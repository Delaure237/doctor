import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CommunicationRepository{

  //message communication
  Future<void> sendMessage(String receiverId, message) ;

  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) ;
}