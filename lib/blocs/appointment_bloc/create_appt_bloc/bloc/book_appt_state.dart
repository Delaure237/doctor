part of 'book_appt_bloc.dart';

sealed class BookApptState extends Equatable {
  const BookApptState();
  
  @override
  List<Object> get props => [];
}

final class BookApptInitial extends BookApptState {}
