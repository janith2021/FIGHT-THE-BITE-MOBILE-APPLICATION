import '../const/all_imports.dart';

class Snackbar {
  static var scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static successSnackBar(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      backgroundColor: AppColors.green,
    ));
  }

  static errorSnackBar(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.red,
    ));
  }
}
