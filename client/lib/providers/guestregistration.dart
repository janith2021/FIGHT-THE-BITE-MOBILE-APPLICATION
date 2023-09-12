import 'dart:ffi';

import 'package:client/const/all_imports.dart';
import 'package:http/http.dart' as http;

class GusetRegistrationProvider extends ChangeNotifier {
  TextEditingController controllername = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllernewgsdivision = TextEditingController();
  TextEditingController controllernewdivisionnumber = TextEditingController();
  TextEditingController controllernewaddress = TextEditingController();
  TextEditingController controllernic = TextEditingController();
  TextEditingController controllercontact = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerconfirmpassword = TextEditingController();
  TextEditingController controlleroldgsdivision = TextEditingController();
  TextEditingController controlleroldgsdivisionnumber = TextEditingController();
  TextEditingController controlleroldaddress = TextEditingController();
  TextEditingController controllermember1name = TextEditingController();
  TextEditingController controllermember1nic = TextEditingController();
  TextEditingController controllermember1mobile = TextEditingController();
  TextEditingController controllermember1gender = TextEditingController();
  TextEditingController controllermember1age = TextEditingController();
  TextEditingController controllermember2name = TextEditingController();
  TextEditingController controllermember2age = TextEditingController();
  TextEditingController controllermember2nic = TextEditingController();
  TextEditingController controllermember2mobile = TextEditingController();
  TextEditingController controllermember2gender = TextEditingController();
  TextEditingController controllermember3name = TextEditingController();
  TextEditingController controllermember3age = TextEditingController();
  TextEditingController controllermember3nic = TextEditingController();
  TextEditingController controllermember3mobile = TextEditingController();
  TextEditingController controllermember3gender = TextEditingController();
  TextEditingController controllermember4name = TextEditingController();
  TextEditingController controllermember4age = TextEditingController();
  TextEditingController controllermember4nic = TextEditingController();
  TextEditingController controllermember4mobile = TextEditingController();
  TextEditingController controllermember4gender = TextEditingController();
  TextEditingController controllerage = TextEditingController();

  String _nameerror = "";
  String _emailerror = "";
  String _passworderror = "";
  String _confirmpassworderror = "";
  String _newgsdivisionerror = "";
  String _newdivisionnumbererror = "";
  String _newaddresserror = "";
  String _oldaddresserror = "";
  String _nicerror = "";
  String _contacterror = "";
  String _oldgsdivisionerror = "";
  String _olddivisionnumbererror = "";
  String _member1name = "";
  String _member1nic = "";
  String _member1mobile = "";
  String _member1gender = "";
  String _member1age = "";
  String _member2name = "";
  String _member2nic = "";
  String _member2mobile = "";
  String _member2gender = "";
  String _member2age = "";
  String _member3name = "";
  String _member3nic = "";
  String _member3mobile = "";
  String _member3gender = "";
  String _member3age = "";
  String _member4name = "";
  String _member4nic = "";
  String _member4mobile = "";
  String _member4gender = "";
  String _member4age = "";
  String _age = "";

  // String _newgsdivisionerror = "";
  // String

  String get nameerror => _nameerror;
  String get emailerror => _emailerror;
  String get passworderror => _passworderror;
  String get confirmpassworderror => _confirmpassworderror;
  String get newgsdivisionerror => _newgsdivisionerror;
  String get newdivisionnumbererror => _newdivisionnumbererror;
  String get newaddresserror => _newaddresserror;
  String get oldaddresserror => _oldaddresserror;
  String get nicerror => _nicerror;
  String get contacterror => _contacterror;
  String get oldgsdivisionerror => _oldgsdivisionerror;
  String get olddivisionnumbererror => _olddivisionnumbererror;
  bool _obscuretext = true;
  bool get obscuretext => _obscuretext;
  String get member1name => _member1name;
  String get member1nic => _member1nic;
  String get member1mobile => _member1mobile;
  String get member1gender => _member1gender;
  String get member1age => _member1age;
  String get member2name => _member2name;
  String get member2nic => _member2nic;
  String get member2mobile => _member2mobile;
  String get member2gender => _member2gender;
  String get member2age => _member2age;
  String get member3name => _member3name;
  String get member3nic => _member3nic;
  String get member3mobile => _member3mobile;
  String get member3gender => _member3gender;
  String get member3age => _member3age;
  String get member4name => _member4name;
  String get member4nic => _member4nic;
  String get member4mobile => _member4mobile;
  String get member4gender => _member4gender;
  String get member4age => _member4age;
  String get age => _age;
  bool step1 = false;

  // TextEditingController getprofile = TextEditingController();
  File? selectedFile;

  updateobscuretext() {
    _obscuretext = !_obscuretext;
    notifyListeners();
  }

  getProfile(File file) {
    selectedFile = file;
  }

  validatestep1() async {
    _newgsdivisionerror = ValidationHelper.validategsdivision(
        controllernewgsdivision.text, "New");
    _newdivisionnumbererror = ValidationHelper.validategsdivisionnumber(
        controllernewdivisionnumber.text, "New");
    _oldgsdivisionerror = ValidationHelper.validategsdivision(
        controlleroldgsdivision.text, "Old");
    if (_newgsdivisionerror == "" &&
        _newdivisionnumbererror == "" &&
        _oldgsdivisionerror == "") {
      debugPrint("Hi");
      step1 = true;
      notifyListeners();
    }
    // debugPrint(step1.toString());
    // debugPrint(_newgsdivisionerror);
    notifyListeners();
    // return step1;
  }

  guestSignUpValidation() async {
    _nameerror = ValidationHelper.validateName(controllername.text);
    _emailerror = ValidationHelper.validateEmail(controlleremail.text);
    _passworderror = ValidationHelper.validatePassword(controllerpassword.text);
    _newaddresserror =
        ValidationHelper.validateaddress(controllernewaddress.text, "New");
    _oldaddresserror =
        ValidationHelper.validateaddress(controlleroldaddress.text, "Old");
    _newgsdivisionerror = ValidationHelper.validategsdivision(
        controllernewgsdivision.text, "New");
    _nicerror = ValidationHelper.validatenic(controllernic.text);
    _oldgsdivisionerror = ValidationHelper.validategsdivision(
        controlleroldgsdivision.text, "Old");
    _newdivisionnumbererror = ValidationHelper.validategsdivisionnumber(
        controllernewdivisionnumber.text, "New");
    _olddivisionnumbererror = ValidationHelper.validategsdivisionnumber(
        controlleroldgsdivisionnumber.text, "Old");
    _contacterror = ValidationHelper.validatecontact(controllercontact.text);
    _confirmpassworderror = ValidationHelper.validateconfirmationpassword(
        controllerconfirmpassword.text, controllerpassword.text);
    _member1name = ValidationHelper.validateName(controllermember1name.text);
    _member1nic = ValidationHelper.validatenic(controllermember1nic.text);
    _member1mobile =
        ValidationHelper.validateMobile(controllermember1mobile.text);
    _member1age = ValidationHelper.validateage(controllermember1age.text);
    _member2name = ValidationHelper.validateName(controllermember2name.text);
    _member2nic = ValidationHelper.validatenic(controllermember2nic.text);
    _member2mobile =
        ValidationHelper.validateMobile(controllermember2mobile.text);
    _member2age = ValidationHelper.validateage(controllermember2age.text);
    _member3name = ValidationHelper.validateName(controllermember3name.text);
    _member3nic = ValidationHelper.validatenic(controllermember3nic.text);
    _member3mobile =
        ValidationHelper.validateMobile(controllermember3mobile.text);
    _member3age = ValidationHelper.validateage(controllermember3age.text);
    _member4name = ValidationHelper.validateName(controllermember4name.text);
    _member4nic = ValidationHelper.validatenic(controllermember4nic.text);
    _member4mobile =
        ValidationHelper.validateMobile(controllermember4mobile.text);
    _member4age = ValidationHelper.validateage(controllermember4age.text);
    _age = ValidationHelper.validateage(controllerage.text);

    // _member1age = ValidationHelper

    if (_nameerror == "" &&
        _emailerror == "" &&
        _passworderror == "" &&
        _newaddresserror == "" &&
        _oldaddresserror == "" &&
        _newgsdivisionerror == "" &&
        _oldgsdivisionerror == "" &&
        _confirmpassworderror == "" &&
        _contacterror == "" &&
        _olddivisionnumbererror == "" &&
        _newdivisionnumbererror == "" &&
        _nicerror == "") {
      var data = {
        "name": controllername.text,
        "nic": controllernic.text,
        "email": controlleremail.text,
        "mobile": controllercontact.text,
        "oldgsDivision": controlleroldgsdivision.text,
        "olddivisionnumber": controlleroldgsdivisionnumber.text,
        "oldaddress": controlleroldaddress.text,
        "newgsDivision": controllernewgsdivision.text,
        "newdivisionnumber": controllernewdivisionnumber.text,
        "password": controllerpassword.text,
      };
      try {
        setHeaders() => {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            };
        var fullurl = '${AllStrings.baseurl}/register';
        var result = await http.post(Uri.parse(fullurl),
            body: jsonEncode(data), headers: setHeaders());
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    notifyListeners();
  }
  // TextEditingController controller
}
