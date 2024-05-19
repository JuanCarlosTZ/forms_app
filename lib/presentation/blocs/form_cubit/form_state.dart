part of 'form_cubit.dart';

class FormState extends Equatable {
  final String user;
  final String email;
  final String password;
  final bool formValid;

  final String? userError;
  final String? emailError;
  final String? passwordError;
  const FormState({
    required this.user,
    required this.email,
    required this.password,
    required this.formValid,
    this.userError,
    this.emailError,
    this.passwordError,
  });

  FormState copyWith({
    String? user,
    String? email,
    String? password,
    bool? formValid,
    String? userError,
    String? emailError,
    String? passwordError,
  }) {
    return FormState(
      user: user ?? this.user,
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
        user,
        email,
        password,
        formValid,
        userError.toString(),
        emailError.toString(),
        passwordError.toString(),
      ];
}
