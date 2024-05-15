part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class SignInWithEmailAndPasswordEvent extends RegisterEvent {
  final RegisterRequestModel? model;

  const SignInWithEmailAndPasswordEvent({this.model});
}
