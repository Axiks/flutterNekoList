import 'package:anime_list_app/block/register_bloc/register_event.dart';
import 'package:anime_list_app/block/register_bloc/register_state.dart';
import 'package:anime_list_app/repository/user_repository.dart';
import 'package:anime_list_app/utils/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async*{
    if (event is RegisterEmailChange) {
      yield* _mapRegisterEmailChangeToState(event.email);
    } else if (event is RegisterPasswordChange){
      yield* _mapRegisterPasswordChangeToState(event.password);
    } else if (event is RegisterSubmitted){
      yield* _mapRegisterSubmittedToState(email: event.email, password: event.password);
    }
  }

  Stream<RegisterState> _mapRegisterEmailChangeToState(String email) async* {
    yield state.update(
        isEmailValid: Validators.isValidEmail(email)
    );
  }

  Stream<RegisterState> _mapRegisterPasswordChangeToState(String password) async* {
    yield state.update(
        isPasswordValid: Validators.isValidPassword(password)
    );
  }

  Stream<RegisterState> _mapRegisterSubmittedToState({
    required String email,
    required String password
  }) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(email, password);
      yield RegisterState.success();
    } catch (_){
      yield RegisterState.failure();
    }
  }

}