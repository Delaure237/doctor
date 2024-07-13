import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'account_type_event.dart';
part 'account_type_state.dart';

class AccountTypeBloc extends Bloc<AccountTypeEvent, AccountTypeState> {
  AccountTypeBloc() : super(const AccountTypeState.unknow()) {
   // print("account bloc");

    on<SelectedAccountEvent>(_onSelectedAccount);
    on<LoadAccountEvent>(_onLoadAccount);
  }

  Future<void> _onSelectedAccount(SelectedAccountEvent event, Emitter<AccountTypeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    if (event.accountType == TypeOfAccount.doctor) {
      await prefs.setString('account_type', 'doctor');
      emit(const AccountTypeState.doctor());
    } else {
      await prefs.setString('account_type', 'patient');
      emit(const AccountTypeState.patient());
    }
  }

  Future<void> _onLoadAccount(LoadAccountEvent event, Emitter<AccountTypeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final accountType = prefs.getString('account_type');

    if (accountType == 'doctor') {
      emit(const AccountTypeState.doctor());
    } else if (accountType == 'patient') {
      emit(const AccountTypeState.patient());
    } else {
      emit( const AccountTypeState.unknow());
    }
  }
}
