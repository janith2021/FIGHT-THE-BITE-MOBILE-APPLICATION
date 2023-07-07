class ValidationHelper {
  static String validateEmail(String value) =>
      value.isEmpty ? "E-mail is Required" : "";
  static String validatePassword(String value) =>
      value.isEmpty ? "Password is Required" : "";
  static String validateconfirmationpassword(String value1, String value2) =>
      value1 == value2 ? "" : "Password and Confirm Password Does not Matches";
  static String validateName(String value) =>
      value.isEmpty ? "User Name is Required" : "";
  static String validateMobile(String value) =>
      value.isEmpty ? "Mobile Number is Required" : "";
  static String validateotp(int value) =>
      value < 10 ? "OTP must contain 4 letters" : "";
}
