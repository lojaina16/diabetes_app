extension AppValidator on String {
  bool get emailValidation => RegExp(r'\w+@\w+\.\w+').hasMatch(this);
  bool get phoneValidation => startsWith('01') && length == 11;
  bool get passwordValidation => length > 7;
}
