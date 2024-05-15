import 'package:firebase_auth/firebase_auth.dart';

final class RegisterResponseModel {
  final String? error;
  final UserCredential? user;

  RegisterResponseModel({
    this.error,
    this.user,
  });
}
