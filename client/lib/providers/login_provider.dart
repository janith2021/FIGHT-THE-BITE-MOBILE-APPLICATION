import '../const/all_imports.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _emailError = "";
  String get emailError => _emailError;
  String _passwordError = "";
  String get passwordError => _passwordError;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  updateobscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  formvalidation(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _emailError = ValidationHelper.validateEmail(emailController.text);
    _passwordError = ValidationHelper.validatePassword(passwordController.text);
    if (_passwordError == "" && _emailError == "") {
      var data = {
        'email': emailController.text,
        'password': passwordController.text
      };
      var fullurl = '${AllStrings.baseurl}/login';
      debugPrint(fullurl);
      setHeaders() =>
          {'Content-Type': 'application/json', 'Accept': 'application/json'};
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(data), headers: setHeaders());
      var body = await jsonDecode(response.body);
      // print(body);
      if (body['type'] == 'success') {
        if (body['role'] == 'user') {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/user/dashboard");
          // ignore: use_build_context_synchronously
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Success",
                  text: body['message']));
          var box1 = await Hive.openBox('users');
          await box1.put('user', emailController.text);
          // debugPrint('hi');
          // await shared.setString('email', emailController.text);
          emailController.text = "";
          passwordController.text = "";

          notifyListeners();
        } else if (body['role'] == 'Grama Niladhari') {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/officer/gramaniladhari/dashboard");
          // ignore: use_build_context_synchronously
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Success",
                  text: body['message']));
          var box1 = await Hive.openBox('users');
          await box1.put('user', emailController.text);
          // debugPrint('hi');
          // await shared.setString('email', emailController.text);
          emailController.text = "";
          passwordController.text = "";

          notifyListeners();
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/officer/phi/dashboard");
          // ignore: use_build_context_synchronously
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Success",
                  text: body['message']));
          var box1 = await Hive.openBox('users');
          await box1.put('user', emailController.text);
          // debugPrint('hi');
          // await shared.setString('email', emailController.text);
          emailController.text = "";
          passwordController.text = "";

          notifyListeners();
        }
        // ignore: use_build_context_synchronously
      } else {
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.danger,
                title: "Error",
                text: body['message']));
      }
    }
    notifyListeners();
  }
}