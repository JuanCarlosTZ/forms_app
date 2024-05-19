bool validateEmail(String value) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  final regex = RegExp(pattern);

  return regex.hasMatch(value);
}

String userFormValidate(String value, {bool isRequired = false}) {
  String? error;

  if (isRequired && value.isEmpty) {
    error = 'Required';
  }

  if (value.isNotEmpty && error == null && value.length <= 3) {
    error = 'Length must be more than 3';
  }

  return error ?? '';
}

String emailFormValidate(String value, {bool isRequired = false}) {
  String? error;

  if (isRequired && value.isEmpty) {
    error = 'Required';
  }

  if (value.isNotEmpty && error == null && !validateEmail(value)) {
    error = 'Must be valid email';
  }

  return error ?? '';
}

String passwordFormValidate(String value, {bool isRequired = false}) {
  String? error;

  if (isRequired && value.isEmpty) {
    error = 'Required';
  }

  if (value.isNotEmpty && error == null && value.length <= 6) {
    error = 'Length must be more than 6';
  }

  return error ?? '';
}
