// import 'dart:html';

import 'package:client/const/all_imports.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OtpProvider extends ChangeNotifier {
  String Otp = "";
  String _otperror = "";
  String get otperror => _otperror;

  // String get otp => _otp;

  otpvalidate(BuildContext context) async {
    // var box1 = await Hive.openBox('myBox');
    // var email = box1.getAt(box1.length-1);
    // box1.clear();
    // debugPrint(box1);
    // _otperror = ValidationHelper.validateotp(Otp.length);
    // debugPrint('${Otp}'.length);
    // if (_otperror == "") {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    debugPrint(email);
    var jwttoken = prefs.getString('token');
    debugPrint(jwttoken);
    var OTP = {
      'email': email,
      'otp': Otp,
    };
    setHeaders() => {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwttoken'
        };
    var fullurl = '${AllStrings.baseurl}/verifyotp';
    var res = await http.post(Uri.parse(fullurl),
        body: jsonEncode(OTP), headers: setHeaders());
    var body = await jsonDecode(res.body);
    // await box1.clear();
    debugPrint(body['message']);
    if (body['type'] == 'success') {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/change');
      // ignore: use_build_context_synchronously
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.success,
              title: "Success",
              text: body['message']));
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

  // notifyListeners();
  // }
}
