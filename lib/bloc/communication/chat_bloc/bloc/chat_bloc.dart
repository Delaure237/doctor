import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communication_repository/communication_repository.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final CommunicationRepository communicationRepo;

  ChatBloc(this.communicationRepo) : super(ChatInitial()) {
    on<SendMessage>(_onSendMessage);
    on<LoadMessages>(_onLoadMessages);
  }

  Future<void> _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    try {
      await communicationRepo.sendMessage(event.receiverId, event.message);
      emit(MessageSent());
    } catch (e) {
      emit( const ChatError('Failed to send message.'));
    }
  }

  Future<void> _onLoadMessages(LoadMessages event, Emitter<ChatState> emit) async {
    try {
      emit(ChatMessagesLoading());

      final messageStream = communicationRepo.getMessage(event.userId, event.otherUserId);
      emit(ChatMessagesLoaded(messageStream));
    } catch (e) {
      emit( const ChatError('Failed to load messages.'));
    }
  }
}

