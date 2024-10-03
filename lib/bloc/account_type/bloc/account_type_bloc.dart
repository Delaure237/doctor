// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'account_type_event.dart';
part 'account_type_state.dart';

class AccountTypeBloc extends Bloc<AccountTypeEvent, AccountTypeState> {
  String? _role;
  AccountTypeBloc() : super(const AccountTypeState.unknow()) {
    on<SelectedAccountEvent>(_onSelectedAccount);
    on<LoadAccountEvent>(_onLoadAccount);

  }

 Future<void> _onSelectedAccount(SelectedAccountEvent event, Emitter<AccountTypeState> emit) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    print("SelectedAccountEvent received with accountType: ${event.accountType}");
    if (event.accountType == TypeOfAccount.doctor) {
      await prefs.setString('account_type', 'doctor');
      emit(const AccountTypeState.doctor());
      print("Emitting doctor state");
    } else {
      await prefs.setString('account_type', 'patient');
      emit(const AccountTypeState.patient());
      print("Emitting patient state");
    }
  } catch (e) {
    print("Error occurred: $e");
    emit(const AccountTypeState.error("Failed to save account type"));
  }
}

  // Getter pour le rôle
  String? get role => _role;
  

Future<void> _onLoadAccount(LoadAccountEvent event, Emitter<AccountTypeState> emit) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final accountType = prefs.getString('account_type');
    print("Loaded accountType from SharedPreferences: $accountType");
       _role =  await _getRoleFromPreferences();

    if (accountType == 'doctor') {
      emit(const AccountTypeState.doctor());
    } else if (accountType == 'patient') {
      emit(const AccountTypeState.patient());
    } else {
      emit(const AccountTypeState.unknow());
    }
  } catch (e) {
    print("Error occurred: $e");
    emit(const AccountTypeState.error("Failed to load account type"));
  }
}

 Future<String> _getRoleFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final accountType = prefs.getString('account_type');
      log("Loaded accountType from SharedPreferences: $accountType");

      return accountType ?? 'unknown'; // Valeur par défaut
    } catch (e) {
      log("Error occurred: $e");
      return 'unknown'; // Valeur par défaut en cas d'erreur
    }
  }
}