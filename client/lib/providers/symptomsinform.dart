import 'package:client/const/all_imports.dart';

class SymptomsinformProvider extends ChangeNotifier {
  TextEditingController controllercomments = TextEditingController();
  List<dynamic> symptoms = [];

  String _symptomserror = "";
  String get symptomerror => _symptomserror;

  symptomsinform() async {
    _symptomserror = ValidationHelper.validatesymptoms(symptoms);
    debugPrint(_symptomserror);
    if (_symptomserror == "") {
      
    }
    notifyListeners();
  }
}
