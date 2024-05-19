import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/config/helper/helper.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit()
      : super(const FormState(
          user: '',
          email: '',
          password: '',
          formValid: false,
        ));

  void onUserChange(String value) {
    final newState = state.copyWith(
      user: value,
      userError: userFormValidate(value),
    );

    _formValid(state: newState);
  }

  void onEmailChange(String value) {
    final newState = state.copyWith(
      email: value,
      emailError: emailFormValidate(value),
    );

    _formValid(state: newState);
  }

  void onPasswordChange(String value) {
    final newState = state.copyWith(
      password: value,
      passwordError: passwordFormValidate(value, isRequired: true),
    );

    _formValid(state: newState);
  }

  void _formValid({FormState? state}) {
    final newState = state ?? this.state;

    print(newState);

    final isValid = (newState.userError == null &&
            newState.emailError == null &&
            newState.passwordError == null)
        //      &&
        // (newState.password.isNotEmpty)
        ;
    final validatedState = newState.copyWith(
      formValid: isValid,
    );
    emit(validatedState);
  }
}
