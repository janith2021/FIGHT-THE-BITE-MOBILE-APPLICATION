// import 'dart:js';

import 'package:client/models/campaign.dart';
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
    // debugPrint(fullurl);
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    try {
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(emailbody), headers: setHeaders());
      // debugPrint("Hi ${response.toString()}");
      if (response.statusCode == 200) {
        var body = await jsonDecode(response.body);
        // debugPrint(body.toString());
        // print(response.statusCode);
        var detail = body['user'];
        // debugPrint(detail['name']);
        await prefer.setString('id', detail['_id']);

        // debugPrint(body['user']);
        // debugPrint(detail['division']);
        // return body;
        return detail['division'];
      }
    } catch (e) {
      print(e);
    }
  }

  // get all campaign date in division

  getCampignDate(BuildContext context) async {
    var divition = await getDivision(context);
    List<Campaign> campaigns = [];
    // debugPrint(divition);

    var fullurl = '${AllStrings.baseurl}/organization/getallcampaigns';
    debugPrint(fullurl);
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var divisionData = {'division': divition};

    try {
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(divisionData), headers: setHeaders());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var allData = data['message'];
        for (var date in allData) {
          DateTime Data = DateTime.parse(date['date']);

          DateTime pickdate = DateTime(Data.year, Data.month, Data.day);
          String formatdate = DateFormat('M/d/y').format(pickdate);
          debugPrint(formatdate);
          var name = date['name'];
          var Campaigndate = formatdate;
          var time = date['time'];
          var status = date['status'];
          var location = date['location'];

          Campaign campaign =
              Campaign(name, Campaigndate, time, status, location);

          campaigns.add(campaign);
        }
        return campaigns;

        // debugPrint(dates['']);
      }
    } catch (e) {
      print(e);
    }
  }

  // create campaign

  submitform(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(campaignnamecontroller.text);
    var body = {
      'name': campaignnamecontroller.text,
      'date': campaigndatecontroller.text,
      'location': campaignlocationcontroller.text,
      'organizationid': prefs.getString('id'),
      'campaigntime' : campaigntimecontroller.text,
    };
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
      // ignore: use_build_context_synchronously
    } else {
      // ignore: use_build_context_synchronously
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              title: "Error",
              type: ArtSweetAlertType.danger,
              text: result['message']));
    }
  }

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
