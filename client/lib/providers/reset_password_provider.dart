import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';
import '../const/all_imports.dart';
import 'package:http/http.dart' as http;

class ResetPasswordProvider extends ChangeNotifier {
  TextEditingController controlleremail = TextEditingController();

  String _emailError = "";
  String get emailError => _emailError;
  String sweetalertmessage = "";

  validateReset(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _emailError = ValidationHelper.validateEmail(controlleremail.text);

    if (_emailError == "") {
      var response = await sendotp();
      //  debugPrint(response);
      if (response == 'error') {
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.danger,
                title: "Error",
                text: sweetalertmessage));
        sweetalertmessage = "";
        notifyListeners();
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/otp');
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.success,
                title: "Success",
                text: sweetalertmessage));
        sweetalertmessage = "";
        // var box = await Hive.openBox('myBox');
        // box.add(controlleremail.text);
      }
    }
    notifyListeners();
  }

  sendotp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'email': controlleremail.text,
    };

    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};
    var fullUrl = '${AllStrings.baseurl}/sendotp';
    debugPrint(fullUrl);
    var res = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: setHeaders());
    var body = await jsonDecode(res.body);
    debugPrint(body.toString());
    sweetalertmessage = body['message'].toString();
    // debugPrint(body['otp']);
    // debugPrint(body['token']);
    notifyListeners();
    if (body['type'] == 'success') {
      await prefs.setString('token', body['token'].toString());
      await prefs.setString('email', controlleremail.text);
    }
    return body['type'];
  }
}
