import 'package:client/const/all_imports.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class NICValidateProvider extends ChangeNotifier {
  TextEditingController controllernic = TextEditingController();

  String _nicerror = "";
  String get nicerror => _nicerror;

  validatenic(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // debugPrint("Hi");
    _nicerror = ValidationHelper.validatenic(controllernic.text);
    if (_nicerror == "") {
      // var body = {"nic": controllernic.text};

      var fullurl = "${AllStrings.baseurl}/getVillages/${controllernic.text}";

      var results = await http.get(Uri.parse(fullurl));
      var result = jsonDecode(results.body);
      // debugPrint(result.toString());
      // debugPrint(result.toString());
      if (result['type'] == "error") {
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                title: "Error",
                type: ArtSweetAlertType.danger,
                text: result['message'].toString()));
      } else if (result['type'] == "success") {
        debugPrint(result.toString());
        await prefs.setString('token', result['token'].toString());
        await prefs.setString('nic', result['message']['nic'].toString());
        await prefs.setString('gsdivision', result['gsdivision'].toString());
        await prefs.setString(
            'divisionnumber', result['divisionnumber'].toString());
        await prefs.setString('houseHoldno', result['houseHoldno'].toString());
        await prefs.setString('name', result['message']['name'].toString());
        await prefs.setString('address', result['address'].toString());
        await prefs.setString('contact', result['contact']);

        // print(result['gsdivision']);
        // WidgetsFlutterBinding.ensureInitialized();
        // final appDocumentDir =
        //     await path_provider.getApplicationDocumentsDirectory();
        // Hive.init(appDocumentDir.path);
        // var box1 = await Hive.openBox('mybox');
        // await box1.put('gsdivision', result['gsdivision']);
        // await box1.put('divisionnumber',result['divisionnumber']);
        // await box1.put('houseHoldno',result['houseHoldno']);
        // print(box1);
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
        controllernic.text = "";
      }
    }
    notifyListeners();
  }
}
