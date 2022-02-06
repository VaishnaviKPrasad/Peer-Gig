class ValidationMethods {
  static bool validateEmail(String inputEmail) {
    inputEmail.trim();
    if (inputEmail.endsWith('@banasthali.in')) {
      return true;
    } else {
      return false;
    }
  }

  static bool validatePassword(String inputPass) {
    inputPass.trim();
    if (inputPass.length >= 6 && inputPass.length <= 12) {
      return true;
    } else {
      return false;
    }
  }
}
