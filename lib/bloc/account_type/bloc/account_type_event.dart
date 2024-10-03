part of 'account_type_bloc.dart';

sealed class AccountTypeEvent extends Equatable {
  const AccountTypeEvent();

  @override
  List<Object> get props => [];
}

class SelectedAccountEvent extends AccountTypeEvent {
  final TypeOfAccount accountType;
  const SelectedAccountEvent(this.accountType);
}

class LoadAccountEvent extends AccountTypeEvent {}
