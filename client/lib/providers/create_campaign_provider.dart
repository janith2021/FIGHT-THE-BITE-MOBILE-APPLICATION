import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/all_imports.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;

class CreateCampaignProvider extends ChangeNotifier {
  TextEditingController campaignnamecontroller = TextEditingController();
  TextEditingController campaigndatecontroller = TextEditingController();
  TextEditingController campaignlocationcontroller = TextEditingController();
  TextEditingController campaigntimecontroller = TextEditingController();
// final SharedPreferences prefer = await SharedPreferences.getInstance();

  List<DateTime> ongoingCampaignDates = []; // Replace with actual data
  DateTime selectedDate = DateTime.now();

  // Get relevant organization division

  getDivision(BuildContext context) async {
    // debugPrint("hi");
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    var email = prefer.getString('user');

    var emailbody = {'email': email};

    // var fullurl = '${AllStrings.baseurl}/organization/view?email=$email';
    var fullurl = '${AllStrings.baseurl}/organization/view';
    debugPrint(fullurl);
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    try {
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(emailbody), headers: setHeaders());
      // debugPrint("Hi ${response.toString()}");
      if (response.statusCode == 200) {
        var body = await jsonDecode(response.body);
        debugPrint(body.toString());
        // print(response.statusCode);
        var Detail = body['user'];
        debugPrint(Detail['name']);
        await prefer.setString('id', Detail['_id']);

        // debugPrint(body['user']);
        // debugPrint(Detail['division']);
        // return body;
      }
    } catch (e) {
      // print(e);
    }
  }

  submitform(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String formatdate =
    //     DateFormat('M/d/y').format(DateTime.parse(campaigndatecontroller.text));
    // debugPrint(formatdate);
    // debugPrint(campaignnamecontroller.text);
    var body = {
      'name': campaignnamecontroller.text,
      'date': campaigndatecontroller.text,
      'location': campaignlocationcontroller.text,
      'organizationid': prefs.getString('userid'),
      'campaigntime': campaigntimecontroller.text
    };
    debugPrint(body.toString());
    var fullurl = '${AllStrings.baseurl}/organization/campaign/create';
    setHeaders() =>
        {'Content-Type': "application/json", 'Accept': "application/json"};
    var res = await http.post(Uri.parse(fullurl),
        body: jsonEncode(body), headers: setHeaders());
    var result = await jsonDecode(res.body);
    debugPrint(result['type'].toString());
    if (res.statusCode == 201) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "/organization/dashboard");
      // ignore: use_build_context_synchronously
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              title: "Success",
              type: ArtSweetAlertType.success,
              text: result['message']));
      campaigndatecontroller.text = "";
      campaigndatecontroller.text = "";
      campaignnamecontroller.text = "";
      campaigntimecontroller.text = "";
      campaignlocationcontroller.text = "";
      notifyListeners();
      // ignore: use_build_context_synchronously
    } else {
      // ignore: use_build_context_synchronously
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              title: "Error",
              type: ArtSweetAlertType.danger,
              text: result['body']['message']));
    }
  }

  // get all campaign date in division

  //  getCampignDate(String divition) async{

  //     var fullurl = '${AllStrings.baseurl}/organization/getallcampaigns';
  //     debugPrint(fullurl);
  //     setHeaders() =>
  //         {'Content-Type': 'application/json', 'Accept': 'application/json'};

  //     try {
  //       var response = await http.post(Uri.parse(fullurl),
  //       body: jsonEncode(divition),
  //       headers: setHeaders());

  //       if (response.statusCode == 200) {
  //         var data = jsonDecode(response.body);

  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2101), // You can adjust the lastDate as needed
  //     selectableDayPredicate: (DateTime date) {
  //       // Check if the selected date is not in the ongoingCampaignDates list
  //       return !ongoingCampaignDates.contains(date);
  //     },
  //   );

  //   if (pickedDate != null && pickedDate != selectedDate) {
  //     // setState(() {
  //     //   selectedDate = pickedDate;
  //     // });
  //   }
  // }
}
