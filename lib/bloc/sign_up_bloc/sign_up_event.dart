part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}
class SignUpRequired extends SignUpEvent{
  final MyUser user;
  final String password;
  const SignUpRequired(this.user, this.password);
}
class UploadImageRequired extends SignUpEvent{
  final MyUser user;
  final File file;
  const UploadImageRequired(this.user, this.file);

}
class VerifyOtpEvent extends SignUpEvent {
  final String otp;

  const VerifyOtpEvent({required this.otp});

  @override
  List<Object> get props => [otp];
}
