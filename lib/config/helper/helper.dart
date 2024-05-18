bool validateEmail(String value) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  final regex = RegExp(pattern);

  return regex.hasMatch(value);
}
