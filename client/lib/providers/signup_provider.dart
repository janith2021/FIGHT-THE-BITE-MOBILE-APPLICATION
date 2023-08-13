// import 'dart:html';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shortid/shortid.dart';
import '../const/all_imports.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;

class SignupProvider extends ChangeNotifier {
  TextEditingController controllername = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerconfirmpassword = TextEditingController();
  TextEditingController controllermobile = TextEditingController();
  File? selectedfile;

  String _nameerror = "";
  String get nameError => _nameerror;
  String _emailerror = "";
  String get emailError => _emailerror;
  String _mobileerror = "";
  String get mobileError => _mobileerror;
  String _passworderror = "";
  String get passwordError => _passworderror;
  String _confirmpassworderror = "";
  String get confirmpasswordError => _confirmpassworderror;
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  String _snackbarmessage = "";
  String get snackbarmessage => _snackbarmessage;

  getProfile(File file) {
    selectedfile = file;
  }

  updateobscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  validateSignUp(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _nameerror = ValidationHelper.validateName(controllername.text);
    _emailerror = ValidationHelper.validateEmail(controlleremail.text);
    _passworderror =
        ValidationHelper.validatePassword(controllerconfirmpassword.text);

    _confirmpassworderror = ValidationHelper.validateconfirmationpassword(
        controllerpassword.text, controllerconfirmpassword.text);
    _mobileerror = ValidationHelper.validateMobile(controllermobile.text);
    if (_nameerror == "" &&
        _emailerror == "" &&
        _passworderror == "" &&
        _confirmpassworderror == "" &&
        _mobileerror == "") {
      // ignore: use_build_context_synchronously
      var body = await signup(context);
      // debugPrint(body.toString());
      if (body == 'error') {
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.danger,
                title: "Error",
                text: snackbarmessage));
        _snackbarmessage = "";
        // return false;
      } else if (body == 'success') {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, "/login");
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.success,
                title: "Success",
                text: snackbarmessage));
        Future.delayed(const Duration(milliseconds: 10000));
        controllername.text = "";
        controlleremail.text = "";
        controllermobile.text = "";
        controllerpassword.text = "";
        controllerconfirmpassword.text = "";
        _snackbarmessage = "";
        // return true;
      } else {
        ArtSweetAlert.show(context: context, artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Registration Failed",
        ));
      }
    }
    notifyListeners();
  }

  signup(BuildContext context) async {
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};
    // const cloud = "dbmtgupsy";
    // if (selectedfile.isNull) {
<<<<<<< HEAD

=======
>>>>>>> 0ee854fbabffd409bd271421a829afcf4c9606b7
    final cloudinary = Cloudinary.unsignedConfig(cloudName: "dbmtgupsy");
    final response1 = await cloudinary.unsignedUpload(
      uploadPreset: "fightthebite",
      fileBytes: selectedfile!.readAsBytesSync(),
      folder: 'FIGHT_THE_BITE/Users',
      resourceType: CloudinaryResourceType.image,
      fileName:
          'FIGHT${controllername.text}_${controlleremail.text}_FIGHTTHEBITEUSERS',
    );
    // debugPrint(response1.secureUrl);
    var data = {
      'name': controllername.text,
      'email': controlleremail.text,
      'password': controllerpassword.text,
      'mobile': controllermobile.text,
      'image': 'hello',
    };
    var fullurl = '${AllStrings.baseurl}/register';
    var response2 = await http.post(
      Uri.parse(fullurl),
      body: jsonEncode(data),
      headers: setHeaders(),
    );
    var body = await jsonDecode(response2.body);
    _snackbarmessage = body['message'];
    notifyListeners();
    return body['type'];
<<<<<<< HEAD

    try {
      var id = shortid.generate();
      var date = DateTime.now();
      var url;
      if (selectedfile != null) {
        final cloudinary =
            Cloudinary.unsignedConfig(cloudName: dotenv.get("CLOUDNAME"));
        final response1 = await cloudinary.unsignedUpload(
          uploadPreset: "fightthebite",
          fileBytes: selectedfile!.readAsBytesSync(),
          folder: 'FIGHT_THE_BITE/Users',
          resourceType: CloudinaryResourceType.image,
          fileName:
              'FIGHT${controllername.text}_${controlleremail.text}_${id}__${date}_FIGHTTHEBITEUSERS',
        );
        // debugPrint(response1.secureUrl);
        // CircularProgressIndicator();
        // response1.secureUrl ?? AllStrings.imageurl;
        url = response1.secureUrl;
      } else {
        url = AllStrings.imageurl;
      }
      // debugPrint(response1.secureUrl);
      debugPrint(url);
      if (url.toString() != null) {
        debugPrint('Inside Function');
        var data = {
          'name': controllername.text,
          'email': controlleremail.text,
          'password': controllerpassword.text,
          'mobile': controllermobile.text,
          'image': url,
          'role': "villager",
        };
        var fullurl = '${AllStrings.baseurl}/villager/register';
        // var fullurl = 'http://10.22.164.217:5000/api/villager/register';
        var response2 = await http.post(
          Uri.parse(fullurl),
          body: jsonEncode(data),
          headers: setHeaders(),
        );
        var body = await jsonDecode(response2.body);
        debugPrint(body.toString());
        _snackbarmessage = body['message'];
        debugPrint(_snackbarmessage);
        notifyListeners();
        return body['type'];
      } else {
        // ignore: use_build_context_synchronously
        ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
                title: 'Error',
                type: ArtSweetAlertType.danger,
                text:
                    "There is an Error while uploading the image. Please Try again Later."));
      }
    } catch (e) {
      debugPrint('hello');
      debugPrint(e.toString());
    }

    // debugPrint(response1.secureUrl);

=======
>>>>>>> 0ee854fbabffd409bd271421a829afcf4c9606b7

    // var message2 = await jsonDecode(response2.body);

    // if (response2.body) {
    //   _snackbarmessage = await jsonDecode(response2.body);
    //   debugPrint(_snackbarmessage);
    // } else {
    //   _snackbarmessage = await jsonDecode(response2.body);
    //   debugPrint(_snackbarmessage);
    // }
  }
  // }
}
