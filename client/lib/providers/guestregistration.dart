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

  // TextEditingController getprofile = TextEditingController();
  File? selectedFile;

  updateobscuretext() {
    _obscuretext = !_obscuretext;
    notifyListeners();
  }

  getProfile(File file) {
    selectedFile = file;
  }

  guestSignUpValidation() async {
    _nameerror = ValidationHelper.validateName(controllername.text);
    _emailerror = ValidationHelper.validateEmail(controlleremail.text);
    _passworderror = ValidationHelper.validatePassword(controllerpassword.text);
    _newaddresserror =
        ValidationHelper.validateaddress(controllernewaddress.text, "New");
    _oldaddresserror =
        ValidationHelper.validateaddress(controlleroldaddress.text, "Old");
    _newgsdivisionerror =
        ValidationHelper.valiategsdivision(controllernewgsdivision.text, "New");
    _nicerror = ValidationHelper.validatenic(controllernic.text);
    _oldgsdivisionerror =
        ValidationHelper.valiategsdivision(controlleroldgsdivision.text, "Old");
    _newdivisionnumbererror = ValidationHelper.validategsdivisionnumber(
        controllernewdivisionnumber.text, "New");
    _olddivisionnumbererror = ValidationHelper.validategsdivisionnumber(
        controlleroldgsdivisionnumber.text, "Old");
    _contacterror = ValidationHelper.validatecontact(controllercontact.text);
    _confirmpassworderror = ValidationHelper.validateconfirmationpassword(
        controllerconfirmpassword.text, controllerpassword.text);

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
