import 'package:formz/formz.dart';

class PasswordInput extends FormzInput<String, String?> {
  final bool isRequired;
  static int lengthMin = 6;
  static int lengthMax = 100;

  const PasswordInput.pure(super.value, {this.isRequired = false})
      : super.pure();
  const PasswordInput.dirty(super.value, {this.isRequired = false})
      : super.dirty();

  @override
  String? validator(String value) {
    if (value.isEmpty && isRequired) return 'Requerido';
    if (value.length <= lengthMin) return 'Must be more than $lengthMin';
    if (value.length >= lengthMax) return 'Must be less than $lengthMax';
    return null;
  }

  PasswordInput copyWith(String? value, {bool? isRequired}) {
    return PasswordInput.dirty(
      value ?? this.value,
      isRequired: isRequired ?? this.isRequired,
    );
  }
}
