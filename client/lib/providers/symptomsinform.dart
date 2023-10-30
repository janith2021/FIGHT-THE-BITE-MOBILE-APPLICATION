// ignore_for_file: use_build_context_synchronously

import 'package:client/const/all_imports.dart';
import 'package:client/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SymptomsinformProvider extends ChangeNotifier {
  TextEditingController controllercomments = TextEditingController();
  List<dynamic> symptoms = [];

  String _symptomserror = "";
  String get symptomerror => _symptomserror;

  symptomsinform(User item, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(symptoms.toString());
    _symptomserror = ValidationHelper.validatesymptoms(symptoms);
    // notifyListeners();
    // debugPrint(_symptomserror.toString());
    if (_symptomserror == "") {
      var body = {
        'name': item.name,
        'houseHoldNo': prefs.getString('householdno'),
        'divisionNumber': prefs.getString('divisionNumber'),
        'nic': item.nic,
        'symptoms': symptoms,
        'contact': item.contact,
      };
      debugPrint(body.toString());
      var fullurl = "${AllStrings.baseurl}/villager/informaffectivity";
      setHeaders() =>
          {'Content-Type': 'application/json', 'Accept': 'application/json'};
      var res = await http.post(Uri.parse(fullurl),
          body: jsonEncode(body), headers: setHeaders());
      var result = await jsonDecode(res.body);
      if (result['type'] == 'success') {
        symptoms.clear();
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, "/villager/inform/affected2");

        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              title: "Success",
              text: result['message'].toString(),
              type: ArtSweetAlertType.success,
            ));
        return true;
      }
    }
    notifyListeners();
  }
}
