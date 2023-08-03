import 'dart:convert';
import 'package:client/const/all_imports.dart';
// import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordProvider extends ChangeNotifier {
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerconfirmpassword = TextEditingController();

  String _passworderror = "";
  String get passwordError => _passworderror;
  String _confirmpassworderror = "";
  String get confirmpasswordError => _confirmpassworderror;
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  updateobscureText() {
    _obscureText = !obscureText;
    notifyListeners();
  }

  validatechangepassword(BuildContext context) async {
    _confirmpassworderror = ValidationHelper.validateconfirmationpassword(
        controllerpassword.text, controllerconfirmpassword.text);
    _passworderror = ValidationHelper.validatePassword(controllerpassword.text);
    // var box1 = await Hive.openBox('myBox');
    // var email = box1.getAt(box1.length - 1);

    if (_confirmpassworderror == "" && _passworderror == "") {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var email = pref.getString('email');
      var token = pref.getString('token');
      if (_passworderror == "") {
        var data = {'email': email, 'password': controllerpassword.text};
        setHeaders() => {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            };
        var fullurl = '${AllStrings.baseurl}/resetpassword';
        var res = await http.post(Uri.parse(fullurl),
            body: jsonEncode(data), headers: setHeaders());
        var body = await jsonDecode(res.body);
        debugPrint(body['type']);
        if (body['type'] == 'success') {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, "/login");
          // ignore: use_build_context_synchronously
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Success",
                  text: body['message']));
          await pref.clear();
          controllerpassword.text = "";
          controllerconfirmpassword.text = "";
          notifyListeners();
        } else {
          if (body['redirect'] == 'true') {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/login');
            // ignore: use_build_context_synchronously
            ArtSweetAlert.show(
                context: context,
                artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.danger,
                    title: "Error",
                    text: body['message']));
            controllerpassword.text = "";
            controllerpassword.text = "";
            pref.clear();
            notifyListeners();
          } else {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, "/login");
            // ignore: use_build_context_synchronously
            ArtSweetAlert.show(
                context: context,
                artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.danger,
                    title: "Error",
                    text: body['message']));
            controllerpassword.text = "";
            controllerconfirmpassword.text = "";
            pref.clear();
          }
        }
      }
    }
    notifyListeners();
  }
}
