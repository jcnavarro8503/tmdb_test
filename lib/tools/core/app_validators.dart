class AppValidators {
  static bool validEmail(String email) {
    return RegExp(r'^.+@[0-9a-zA-Z]+\.{1}[0-9a-zA-Z]+(\.{0,1}[0-9a-zA-Z]+)$').hasMatch(email);
  }

  static bool validPasswordLength(String password) {
    return password.length >= 8;
  }

  static bool validPasswordNoWhiteSpaces(String password) {
    return !password.contains(" ");
  }
}
