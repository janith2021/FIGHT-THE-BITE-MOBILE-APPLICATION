// import 'dart:js';

import 'package:client/const/all_imports.dart';
// import 'package:client/screen/authentication/villagerRegistration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VillagerRegistrationProvider extends ChangeNotifier {
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerconfirmpassword = TextEditingController();

  bool _obscuretext = true;
  bool get obscuretext => _obscuretext;
  String _emailerror = "";
  String get emailerror => _emailerror;
  String _passworderror = "";
  String get passworderror => _passworderror;
  String _confirmpassworderror = "";
  String get confirmpassworderror => _confirmpassworderror;

  updateobscuretext() {
    _obscuretext = !_obscuretext;
    notifyListeners();
  }

  VillagerRegister(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _emailerror = ValidationHelper.validateEmail(controlleremail.text);
    _passworderror = ValidationHelper.validatePassword(controllerpassword.text);
    _confirmpassworderror = ValidationHelper.validateconfirmationpassword(
        controllerpassword.text, controllerconfirmpassword.text);
    if (_emailerror == "" &&
        _passworderror == "" &&
        _confirmpassworderror == "") {
      var body = {
        'email': controlleremail.text,
        'password': controllerpassword.text,
        'divisionNumber': prefs.getString('divisionnumber'),
        'gsDivision': prefs.getString('gsdivision'),
        'nic': prefs.getString('nic'),
        'contact': prefs.getString('contact'),
        'name': prefs.getString('name')
      };
      var fullurl = "${AllStrings.baseurl}/villager/register";
      setHeaders() =>
          {'Content-Type': 'application/json', 'Accept': 'application/json'};
      var res = await http.post(Uri.parse(fullurl),
          body: jsonEncode(body), headers: setHeaders());
      var data = jsonDecode(res.body);
      debugPrint(data.toString());
      if (data['type'] == "success") {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, "/login");
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              title: "Success",
              type: ArtSweetAlertType.success,
              text: data['message'],
            ));
        controlleremail.text = "";
        controllerpassword.text = "";
        controllerconfirmpassword.text = "";
      } else {
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                title: "Error",
                type: ArtSweetAlertType.danger,
                text: data['message'].toString()));
      }
    }

    notifyListeners();
  }
}
