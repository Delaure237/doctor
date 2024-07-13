import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_appt_event.dart';
part 'book_appt_state.dart';

class BookApptBloc extends Bloc<BookApptEvent, BookApptState> {
  BookApptBloc() : super(BookApptInitial()) {
    on<BookApptEvent>((event, emit) {
     
    });
  }
}
