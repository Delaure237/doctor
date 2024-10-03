part of 'chat_bloc.dart';

sealed class ChatEvent  extends Equatable {
  const ChatEvent ();

  @override
  List<Object> get props => [];
}


// Événement pour envoyer un message
class SendMessage extends ChatEvent {
  final String receiverId;
  final String message;

  const SendMessage({required this.receiverId, required this.message});

  @override
  List<Object> get props => [receiverId, message];
}

// Événement pour récupérer les messages via Stream
class LoadMessages extends ChatEvent {
  final String userId;
  final String otherUserId;

  const LoadMessages({required this.userId, required this.otherUserId});

  @override
  List<Object> get props => [userId, otherUserId];
}
