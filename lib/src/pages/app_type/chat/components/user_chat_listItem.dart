
// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication_repository/communication_repository.dart';
import 'package:doctor/src/pages/app_type/chat/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



  class UserChatListItem extends StatelessWidget {
  final String receiverName;
  final String urlPath;
  final String receiverId;
  final int unreadMessage;
  final String appointmentId;
  final DateTime date;
  final TimeOfDay time;

  const UserChatListItem({
    super.key,
    required this.receiverName,
    required this.urlPath,
    required this.unreadMessage,
    required this.receiverId, required this.appointmentId, required this.date, required this.time,
  });

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    return DateFormat('H:m').format(now);
  }

  // Méthode pour tronquer le message si trop long
  String _truncateMessage(String message, {int maxLength = 30}) {
    if (message.length > maxLength) {
      return '${message.substring(0, maxLength)}...';
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseCommunicationRepo CommunicationRepository = FirebaseCommunicationRepo();
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    // Créer un chatRoomId unique basé sur les deux userId
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // Trier les ids pour garantir l'unicité
    String chatRoomId = ids.join('_'); // Créer le chatRoomId

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ChatPageView(
                receiverName: receiverName,
                receiverUrlImage: urlPath,
                receiverId: receiverId, apptId: appointmentId, 
                date: date, appointmentTime: time,
              );
            },
          ),
        );
      },
      child: StreamBuilder<QuerySnapshot>(
        stream: CommunicationRepository.getLastMessage(chatRoomId),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildListTile(context, 'Aucun message');
          }

          // Extraire le dernier message
          final lastMessageDoc = snapshot.data!.docs.first;
          final lastMessage = lastMessageDoc['message'] as String;

          return _buildListTile(context, _truncateMessage(lastMessage));
        },
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String lastMessage) {
    return ListTile(
      leading: ClipOval(
        child: Image.asset(
          urlPath,
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        receiverName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
      ),
      subtitle: Text(
        lastMessage,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              fontSize: 14,
            ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _getCurrentTime(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 12,
                ),
          ),
          if (unreadMessage > 0)
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "$unreadMessage",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Récupérer le dernier message en utilisant le chatRoomId

