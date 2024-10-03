
// ignore_for_file: unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../communication_repository.dart';

class FirebaseCommunicationRepo implements  CommunicationRepository{
    final  comCollection = FirebaseFirestore.instance.collection("communications");
    final chatCollection = FirebaseFirestore.instance.collection("chat_rooms");
    final messageCollection = FirebaseFirestore.instance.collection("message");
      final FirebaseAuth _firebaseAuth;
     FirebaseCommunicationRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;



      @override
Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
  List<String> ids = [userId, otherUserId];
  ids.sort();
  String chatRoomId = ids.join("_");

  return chatCollection
    .doc(chatRoomId)
    .collection("messages")
    .orderBy("timestamp", descending: false)
    .snapshots()
    .handleError((error) => print("Erreur de récupération des messages: $error"));
}


    
      @override
    Future<void> sendMessage(String receiverId, message) async {
  //get current user info
  final String currentUserId = _firebaseAuth.currentUser!.uid;
  final String currentUserEmail = _firebaseAuth.currentUser!.email!;
  final Timestamp timestamp = Timestamp.now();

  //create a new message
  Message newMessage = Message(
    senderId: currentUserId, 
      receiverId: receiverId,
       message: message,
        timestamp: timestamp
        );

//construct chat room ID for the two users (sorted to ensure uniqueness)
List<String> ids = [currentUserId , receiverId];
ids.sort(); //sort the if(this is ensure that the chatRoomId is the same for the 2 peoples)
String chatRoomId = ids.join('_');
//add new message to database
await chatCollection.
doc(chatRoomId).
collection("messages").
add(newMessage.toEntity().toDocument());


}

Stream<QuerySnapshot> getLastMessage(String chatRoomId) {
  return FirebaseFirestore.instance
      .collection('chatRooms')
      .doc(chatRoomId)
      .collection('messages')
      .orderBy('timestamp', descending: true) // Trier par ordre décroissant
      .limit(1) // Limiter à 1 message (le dernier)
      .snapshots();
}

// video call communication 

}
