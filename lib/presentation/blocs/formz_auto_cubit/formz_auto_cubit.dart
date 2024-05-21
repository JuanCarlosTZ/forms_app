import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infraestructure/formzs/formzs.dart';
import 'package:formz/formz.dart';

part 'formz_auto_state.dart';

class FormzAutoCubit extends Cubit<FormzAutoState> with FormzMixin {
  FormzAutoCubit()
      : super(const FormzAutoState(
          username: UsernameInput.pure('', isRequired: true),
          password: PasswordInput.pure('', isRequired: true),
        ));

  void onUserChange(String value) {
    final username = state.username.copyWith(value);
    final usernameError = _usernameError(username);

    final newState = state.copyWith(
      username: username,
      userError: usernameError,
    );

    _formValid(state: newState);
  }

  void onEmailChange(String value) {
    final email = state.email.copyWith(value);
    final emailError = _emailError(email);

    final newState = state.copyWith(
      email: state.email.copyWith(value),
      emailError: emailError,
    );

    _formValid(state: newState);
  }

  void onPasswordChange(String value) {
    final password = state.password.copyWith(value);
    final passwordError = password.validator(value);

    final newState = state.copyWith(
      password: password,
      passwordError: passwordError ?? '',
    );

    _formValid(state: newState);
  }

  void _formValid({FormzAutoState? state}) {
    final newState = state ?? this.state;

    final isValid = (newState.username.isValid &&
        newState.email.isValid &&
        newState.password.isValid);

    final validatedState = newState.copyWith(
      formValid: isValid,
    );

    emit(validatedState);
  }

  @override
  List<FormzInput<String, dynamic>> get inputs =>
      [state.username, state.email, state.password];
}

String _usernameError(UsernameInput username) {
  switch (username.validator(username.value)) {
    case UsernameError.required:
      return 'Required';
    case UsernameError.lengthMin:
      return 'Must be more than ${UsernameInput.lengthMin}';
    case UsernameError.lengthMax:
      return 'Must be less than ${UsernameInput.lengthMax}';
    default:
      return '';
  }
}

String _emailError(EmailInput email) {
  switch (email.validator(email.value)) {
    case EmailError.required:
      return 'Required';
    case EmailError.invalid:
      return 'Must be a valid email';
    case EmailError.lengthMax:
      return 'Must be less than ${EmailInput.lengthMax}';
    default:
      return '';
  }
}
