import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_appt_event.dart';
part 'get_appt_state.dart';

class GetApptBloc extends Bloc<GetApptEvent, GetApptState> {
  GetApptBloc() : super(GetApptInitial()) {
    on<GetApptEvent>((event, emit) {
      
    });
  }
}
