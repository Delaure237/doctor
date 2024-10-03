

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/src/models/message.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //get instance of firestore

  final FirebaseFirestore _firestore =  FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  /*send message */
Future<void> sendMessage(String receiverId, message) async {
  //get current user info
  final String currentUserId = _auth.currentUser!.uid;
  final String currentUserEmail = _auth.currentUser!.email!;
  final Timestamp timestamp = Timestamp.now();

  //create a new message
  Message newMessage = Message(
    senderId: currentUserEmail, 
    senderEmail:currentUserEmail,
      receiverId: receiverId,
       message: message,
        timestamp: timestamp
        );

//construct chat room ID for the two users (sorted to ensure uniqueness)
List<String> ids = [currentUserId , receiverId];

String chatRoomId = ids.join('_');
//add new message to database
await _firestore.collection("chat_rooms").
doc(chatRoomId).
collection("messages").
add(newMessage.toMap());


}

//get message
Stream<QuerySnapshot> getMessage(String userId ,otherUserId){
  //construct the chatroom id for the two users
  List<String> ids= [userId, otherUserId];
  ids.sort();
  String chatRoomId = ids.join("_");

  return _firestore.collection("chat_rooms").doc(chatRoomId).collection("message").orderBy(
    "timestamp",descending: false).snapshots();
  
}


  //get User Stream
  /*

  List<Map<String,dynamic>> = {
  [
{
  'email' : test@gmail.com
  'id': ...
  },
  {
  'email' : mitch@gmail.com
  'id': ...
  }
  ]
  */


  Stream<List<Map<String,dynamic>>> getUserStream (){
   return _firestore.collection("doctors").snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
   final user = doc.data();
   return user;
    }).toList();
   });

  }
}

/*Widget _buildUserList(){
  return StreamBuilder(
    stream: getUserStream(), 
    builder:(context,snapshot){
      if (snapshot.hasError) {
        return const Text("error");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }
      
      return ListView(
        children: snapshot.data!.map<Widget>((userData)=>_buildUserListItem(userData, context)).toList(),
      );
    }

    );
}

//build individual list Tile for user

Widget _buildUserListItem(Map<String,dynamic> ,BuildContext context){
  //display all users except current;
  
}
}*/