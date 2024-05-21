import 'package:forms_app/config/helper/helper.dart';
import 'package:formz/formz.dart';

enum EmailError { required, lengthMax, invalid }

class EmailInput extends FormzInput<String, EmailError?> {
  static int lengthMax = 100;
  final bool isRequired;

  const EmailInput.pure(
    super.value, {
    this.isRequired = false,
  }) : super.pure();

  const EmailInput.dirty(
    super.value, {
    this.isRequired = false,
  }) : super.dirty();

  @override
  EmailError? validator(String value) {
    if (value.isEmpty && !isRequired) return null;
    if (value.isEmpty && isRequired) return EmailError.required;
    if (value.length >= lengthMax) return EmailError.lengthMax;
    if (!validateEmail(value)) return EmailError.invalid;
    return null;
  }

  EmailInput copyWith(String? value, {bool? isRequired}) {
    return EmailInput.dirty(
      value ?? this.value,
      isRequired: isRequired ?? this.isRequired,
    );
  }
}
