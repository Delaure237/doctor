part of 'get_appt_bloc.dart';

sealed class GetApptState extends Equatable {
  const GetApptState();
  
  @override
  List<Object> get props => [];
}

final class GetApptInitial extends GetApptState {}
