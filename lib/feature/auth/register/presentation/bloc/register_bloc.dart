// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:pera_soft1/feature/auth/register/data/models/register_request_model.dart';
import 'package:pera_soft1/feature/auth/register/data/models/register_response_model.dart';
import 'package:pera_soft1/product/firebase/service/firebase_auth_service.dart';
import '../../../../../product/state/base/model/base_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  final FirebaseAuthService _firebaseAuthService;
  RegisterBloc(
    this._firebaseAuthService,
  ) : super(const RegisterState()) {
    on<SignInWithEmailAndPasswordEvent>(
      (event, emit) async {
        if (event.model == null) return;
        final model = await _firebaseAuthService
            .createUserWithEmailAndPassword(event.model!);
        safeEmit(RegisterState(model: model));
      },
    );
  }
}
