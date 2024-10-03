part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();
  
  @override
  List<Object> get props => [];
}

final class MessageInitial extends ChatState {}
class MessageLoaded extends ChatState{}
class MessageSuccess extends ChatState{}
class MessageFailure extends ChatState{}



// État initial
class ChatInitial extends ChatState {}

// État lors de la récupération des messages
class ChatMessagesLoading extends ChatState {}

// État avec les messages récupérés
class ChatMessagesLoaded extends ChatState {
  final Stream<QuerySnapshot> messageStream;

  const ChatMessagesLoaded(this.messageStream);

  @override
  List<Object> get props => [messageStream];
}

// État lorsqu'un message est envoyé avec succès
class MessageSent extends ChatState {}

// État en cas d'erreur
class ChatError extends ChatState {
  final String message;

  const ChatError(this.message);

  @override
  List<Object> get props => [message];
}
