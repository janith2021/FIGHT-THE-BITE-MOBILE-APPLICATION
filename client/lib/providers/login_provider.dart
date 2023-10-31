import 'package:shared_preferences/shared_preferences.dart';

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

    final SharedPreferences prefer = await SharedPreferences.getInstance();
    _emailError = ValidationHelper.validateEmail(emailController.text);
    _passwordError = ValidationHelper.validatePassword(passwordController.text);
    if (_passwordError == "" && _emailError == "") {
      var data = {
        'username': emailController.text,
        'password': passwordController.text
      };
      var fullurl = '${AllStrings.baseurl}/login';
      // var fullurl = "http://localhost:5000/api/register";
      // debugPrint(data.toString());
      debugPrint(fullurl);
      setHeaders() =>
          {'Content-Type': 'application/json', 'Accept': 'application/json'};
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(data), headers: setHeaders());
      var body = await jsonDecode(response.body);
      // print(body);
      // print(body['role']);
      if (body['type'].toString() == 'success') {
        // print(body['role']);
        // debugPrint(body.toString());
        if (body['role'] == 'Villager') {
          await prefer.setString('user', body['name'].toString());
          await prefer.setString(
              'householdno', body['user']['houseHoldNo'].toString());
          await prefer.setString('email', body['username'].toString());
          await prefer.setString(
              'divisionNumber', body['user']['divisionNumber'].toString());
          // debugPrint(body['name'].toString());
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/user/dashboard");
          // ignore: use_build_context_synchronously
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Success",
                  text: body['message']));
          // debugPrint(body);

          // var box1 = await Hive.openBox('users');
          // await box1.put('user', emailController.text);
          // debugPrint('hi');
          // print(body['message']);
          await prefer.setString('email', emailController.text);
          await prefer.setString('id', body['id']);

          emailController.text = "";
          passwordController.text = "";

          notifyListeners();
        } else if (body['role'] == 'ORG') {
          debugPrint(body['user'].toString());
          await prefer.setString("userid", body["id"].toString());
          await prefer.setString("userName", body['user']['name'].toString());
          await prefer.setString("contact", body['user']['contact'].toString());
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/organization/dashboard");
          // ignore: use_build_context_synchronously
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Success",
                  text: body['message']));
          // var box1 = await Hive.openBox('users');
          // await box1.put('user', emailController.text);
          await prefer.setString('user', emailController.text);
          await prefer.setString('password', passwordController.text);
          // await prefer.getString('user');
          // debugPrint('hi');
          // await shared.setString('email', emailController.text);
          emailController.text = "";
          passwordController.text = "";

          // notifyListeners();
        } else if (body['role'] == 'PHI') {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/officer/phi/dashboard");
          // ignore: use_build_context_synchronously
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Success",
                  text: body['message']));
          // var box1 = await Hive.openBox('users');
          // await box1.put('user', emailController.text);
          await prefer.setString('user', emailController.text);
          await prefer.setString('userName', body['name']);
          // debugPrint('hi');
          // await shared.setString('email', emailController.text);
          emailController.text = "";
          passwordController.text = "";

          // notifyListeners();
        } else {
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

          // notifyListeners();
        }
        // ignore: use_build_context_synchronously
      } else {
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.danger,
                title: "Error",
                text: body['error']));
      }
    }
    notifyListeners();
  }
}
