import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/config/helper/helper.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit()
      : super(const FormState(
            user: '', email: '', password: '', formValid: false));

  void onUserChange(String value) {
    String? error;

    if (value.isEmpty) {
      error = 'Required';
    }

    if (error == null && value.length <= 3) {
      error = 'Length must be more than 3';
    }
    final newState = state.copyWith(
      user: value,
      userError: error,
      passwordError: state.passwordError,
      emailError: state.emailError,
    );

    emit(newState);
    _formValid();
  }

  void onEmailChange(String value) {
    String? error;

    if (value.isEmpty) {
      error = 'Required';
    }

    if (error == null && !validateEmail(value)) {
      error = 'Must be valid email';
    }

    emit(state.copyWith(
      email: value,
      emailError: error,
      userError: state.userError,
      passwordError: state.passwordError,
    ));
    _formValid();
  }

  void onPasswordChange(String value) {
    String? error;

    if (value.isEmpty) {
      error = 'Required';
    }

    if (error == null && value.length <= 6) {
      error = 'Length must be more than 6';
    }

    emit(state.copyWith(
      password: value,
      passwordError: error,
      userError: state.userError,
      emailError: state.emailError,
    ));
    _formValid();
  }

  void _formValid() {
    final isValid = (state.userError == null &&
            state.emailError == null &&
            state.passwordError == null) &&
        (state.password.isNotEmpty);
    emit(state.copyWith(
      formValid: isValid,
      userError: state.userError,
      emailError: state.emailError,
      passwordError: state.passwordError,
    ));
  }
}
