import 'package:formz/formz.dart';

enum UsernameError { required, lengthMin, lengthMax }

class UsernameInput extends FormzInput<String, UsernameError> {
  final bool isRequired;
  static int lengthMin = 2;
  static int lengthMax = 50;

  const UsernameInput.pure(super.value, {this.isRequired = false})
      : super.pure();
  const UsernameInput.dirty(super.value, {this.isRequired = false})
      : super.dirty();

  @override
  UsernameError? validator(String value) {
    if (value.isEmpty && isRequired) return UsernameError.required;
    if (value.length <= 2) return UsernameError.lengthMin;
    if (value.length >= 50) return UsernameError.lengthMax;
    return null;
  }

  UsernameInput copyWith(String? value, {bool? isRequired}) {
    return UsernameInput.dirty(
      value ?? this.value,
      isRequired: isRequired ?? this.isRequired,
    );
  }
}
