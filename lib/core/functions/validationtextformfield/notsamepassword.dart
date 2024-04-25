noteSamePasswords(String password, String confirmPassword) {
  if (confirmPassword.isEmpty) {
    return "value can't be empty";
  }
  if (password != confirmPassword) {
    return "Passwords should be the same";
  }
}
