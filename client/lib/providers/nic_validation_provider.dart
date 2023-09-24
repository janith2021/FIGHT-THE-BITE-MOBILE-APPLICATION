import 'package:client/const/all_imports.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NICValidateProvider extends ChangeNotifier {
  TextEditingController controllernic = TextEditingController();

  String _nicerror = "";
  String get nicerror => _nicerror;

  validatenic(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("Hi");
    _nicerror = ValidationHelper.validatenic(controllernic.text);
    if (_nicerror == "") {
      // var body = {"nic": controllernic.text};

      var fullurl = "${AllStrings.baseurl}/getVillages/${controllernic.text}";

      var results = await http.get(Uri.parse(fullurl));
      var result = jsonDecode(results.body);
      debugPrint(result.toString());
      debugPrint(result.toString());
      if (result['type'] == "error") {
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                title: "Error",
                type: ArtSweetAlertType.danger,
                text: result['message'].toString()));
      } else if (result['type'] == "success") {
        await prefs.setString('token', result['token'].toString());
        await prefs.setString('nic', result['message']['nic'].toString());
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, "/otp");
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              title: "Success",
              text: "NIC Validated Successfully",
              type: ArtSweetAlertType.success,
            ));
      }
    }
    notifyListeners();
  }
}
