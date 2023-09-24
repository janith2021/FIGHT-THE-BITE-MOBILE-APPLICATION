// import 'dart:html';

import 'package:client/const/all_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OtpProvider extends ChangeNotifier {
  String Otp = "";
  final String _otperror = "";
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
    // debugPrint("Hi");
    var email = prefs.getString('email');
    var villager = prefs.getString('nic');
    // debugPrint("HI $villager");
    if (email != null) {
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
      var fullurl = '${AllStrings.baseurl}/verifyotpmobile';
      // var fullurl = 'http://192.168.141.183:5000/api/verifyotp';
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
    if (villager != null) {
      var jwttoken = prefs.getString('token');
      debugPrint(jwttoken);
      var OTP = {
        'nic': villager,
        'otp': Otp,
      };
      // debugPrint("Hello"+villager.toString());
      setHeaders() => {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $jwttoken'
          };
      var fullurl = '${AllStrings.baseurl}/verifyotpmobile';
      // var fullurl = 'http://192.168.141.183:5000/api/verifyotp';
      var res = await http.post(Uri.parse(fullurl),
          body: jsonEncode(OTP), headers: setHeaders());
      var body = await jsonDecode(res.body);
      // await box1.clear();
      debugPrint(body['message'].toString());
      if (body['type'] == 'success') {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/nicvalidate/register');
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
    // else {

    // }
  }

  // notifyListeners();
  // }
}
