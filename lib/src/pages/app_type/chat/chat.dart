// ignore_for_file: unused_element, unused_import, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication_repository/communication_repository.dart';
import 'package:doctor/src/pages/app_type/chat/components/chatBubble.dart';
import 'package:doctor/src/pages/shared/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../shared/constant/constant.dart';
import '../video/services_video.dart';

class ChatPageView extends StatefulWidget {
  final TimeOfDay appointmentTime;
  final String receiverName;
  final String receiverUrlImage;
  final String apptId;
  final DateTime date;
  final String receiverId;
  const ChatPageView({super.key, 
  required this.receiverName,
   required this.receiverUrlImage, required this.receiverId, required this.apptId, required this.date,required this.appointmentTime});

  @override
  State<ChatPageView> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPageView> {
final   TextEditingController _messageController = TextEditingController();
// ignore: non_constant_identifier_names
final FirebaseCommunicationRepo CommunicationRepository = FirebaseCommunicationRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: Header(context, widget.receiverName,[
   Row(
      children: [
 const Icon(Iconsax.call5),
const SizedBox(width:20),
InkWell(
  onTap :(){
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: 
      (BuildContext context) => VideoCallPage(
       appointmentTime:widget.appointmentTime,
        otherUserId: widget.receiverId, 
       appointmentId: widget.apptId, 
      appointmentDate: widget.date,
        receiverName: widget.receiverName,
       )));
    });
  },
  child:  const Icon(Iconsax.video5)
  ),
PopupMenuButton(itemBuilder: (context){
 return [
  PopupMenuItem(child: GestureDetector(
    onTap: (){

    },
    child:const Text("report")
  )), PopupMenuItem(child: GestureDetector(
    onTap: (){

    },
    child:const Text("block")
  ))
 ];
}),
const SizedBox(width:7),
      ],
    )
   ]),
   body: Column(
     children: [
//display all messages
Expanded(child: _buildMessageList()) ,

//display the user input
_buildUserInput()
     ],
   ),
    );
  }


//build message input

Widget _buildUserInput() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){

          },
          child:const Icon(Icons.attach_file_rounded),
        ),
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration:  InputDecoration(
              hintText: "Enter a message",
              focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30),
              ),
              ),
            filled: true,
              fillColor: Colors.grey[200],
            
            ),
            )
                  ),
      
    

      GestureDetector(
  onTap: () async {
    if (_messageController.text.trim().isNotEmpty) {
      await CommunicationRepository.sendMessage(widget.receiverId , _messageController.text.trim());
      _messageController.clear(); // Effacer le champ de texte après l'envoi
    }
  },
  child: Container(
    height: 56,
    width: 56,
    decoration: const BoxDecoration(
      color: primaryColor,
      shape: BoxShape.circle,
    ),
    child: const Center(child: Icon(Icons.send, color: bgColor)),
  ),

),
      ]
    ),
  
    );
    
 
}
Widget _buildMessageItem(DocumentSnapshot doc) {
  // Convertir le snapshot en entité Message
  final data = doc.data() as Map<String, dynamic>;
  final message = Message.fromEntity(MessageEntity.fromDocument(data));
  final isCurrentUser = message.senderId == FirebaseAuth.instance.currentUser!.uid;

  return Align(
    alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
    child: ChatBubble(
      message: message.message,
      isCurrentUser: isCurrentUser,
    ),
  );
}

Widget _buildMessageList() {
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final String otherUserId = widget.receiverId; 
  
  return StreamBuilder<QuerySnapshot>(
    stream: CommunicationRepository.getMessage(currentUserId, otherUserId),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error : ${snapshot.error}');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(child: Text("no message yet."));
      }

      // Construire la liste de messages
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          return _buildMessageItem(snapshot.data!.docs[index]);
        },
      );
    },
  );
}


}