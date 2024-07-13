part of 'account_type_bloc.dart';

class AccountTypeState extends Equatable{
  final TypeOfAccount selectedAccount;
 
  
  
  const AccountTypeState._({
    this.selectedAccount = TypeOfAccount.unknow,
    
  }); 

  const AccountTypeState.unknow(): this._();
  const AccountTypeState.doctor():
  this._(selectedAccount:TypeOfAccount.doctor);
  const AccountTypeState.patient():
  this._(selectedAccount: TypeOfAccount.patient );

 /* const AccountTypeState.unknow():this._();
  const AccountTypeState.doctor(typea):this._(type: TypeOfAccount.doctor);
  const AccountTypeState.patient(typea):this._(type: TypeOfAccount.patient);*/


  @override
 
  List<Object?> get props => [selectedAccount];

}

