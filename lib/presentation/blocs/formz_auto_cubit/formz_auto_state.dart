part of 'formz_auto_cubit.dart';

class FormzAutoState extends Equatable {
  final UsernameInput username;
  final EmailInput email;
  final PasswordInput password;
  final bool formValid;

  final String userError;
  final String emailError;
  final String passwordError;
  const FormzAutoState({
    this.username = const UsernameInput.pure(''),
    this.email = const EmailInput.pure(''),
    this.password = const PasswordInput.pure(''),
    this.formValid = false,
    this.userError = '',
    this.emailError = '',
    this.passwordError = '',
  });

  FormzAutoState copyWith({
    UsernameInput? username,
    EmailInput? email,
    PasswordInput? password,
    bool? formValid,
    String? userError,
    String? emailError,
    String? passwordError,
  }) {
    return FormzAutoState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      formValid: formValid ?? this.formValid,
      userError: userError ?? this.userError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }

  @override
  List<Object> get props => [
        username,
        email,
        password,
        formValid,
        userError,
        emailError,
        passwordError,
      ];
}
