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
  static String validategsdivision(String value, String type) =>
      value.isEmpty ? "$type Division Name is Required" : "";
  static String validategsdivisionnumber(String value, String type) =>
      value.isEmpty ? "$type Division Number is Required" : "";
  static String validateaddress(String value, String type) =>
      value.isEmpty ? "$type Address is Required" : "";
  static String validatenic(String value) => value.isEmpty
      ? "NIC Number is Required"
      : (value.length == 10 || value.length == 12 ? "" : "Invalid NIC Number");
  static String validateniccharacters(String value) =>
      value.length == 10 || value.length == 12 ? "" : "Invalid NIC Number";
  static String validatecontact(String value) =>
      value.length == 10 ? "" : "Contact Number must contains 10 characters";
  static String validateage(String value) =>
      value.isEmpty ? "Age is Requird" : "";
  static String validatesymptoms(List<dynamic> value) =>
      value.isEmpty ? "Symptoms are required" : "";
  // static String validate
}
