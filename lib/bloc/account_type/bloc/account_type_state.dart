part of 'account_type_bloc.dart';

enum TypeOfAccount {
  patient,
  doctor,
  unknow,
}

class AccountTypeState extends Equatable {
  final TypeOfAccount selectedAccount;
  final String? errorMessage;

  const AccountTypeState._({
    this.selectedAccount = TypeOfAccount.unknow,
    this.errorMessage,
  });

  const AccountTypeState.unknow() : this._();
  const AccountTypeState.doctor() : this._(selectedAccount: TypeOfAccount.doctor);
  const AccountTypeState.patient() : this._(selectedAccount: TypeOfAccount.patient);
  const AccountTypeState.error(String message) : this._(errorMessage: message);

  @override
  List<Object?> get props => [selectedAccount, errorMessage ?? ''];
}
