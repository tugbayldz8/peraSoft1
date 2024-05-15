import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pera_soft1/feature/auth/register/data/models/register_request_model.dart';
import 'package:pera_soft1/feature/auth/register/data/models/register_response_model.dart';

final class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<RegisterResponseModel> createUserWithEmailAndPassword(
      RegisterRequestModel model) async {
    if (model.email == null || model.password == null) {
      return RegisterResponseModel(error: 'E-mail veya şifre boş olamaz!');
    }
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: model.email!,
        password: model.password!,
      );
      return RegisterResponseModel(user: userCredential);
    } on FirebaseAuthException catch (e) {
      return RegisterResponseModel(error: e.message);
    }
  }
}
