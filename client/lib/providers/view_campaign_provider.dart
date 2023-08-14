import 'dart:ffi';

// import 'package:client/models/campaign.dart';
import 'package:date_only_field/date_only_field.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/all_imports.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as provider;

import '../models/campaign.dart';

class ViewCampaignProvider extends ChangeNotifier {
  // Get relevant organization division

  getDivision(BuildContext context) async {
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    var email = prefer.getString('user');

    var emailbody = {'email': email};

    var fullurl = '${AllStrings.baseurl}/organization/view';
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    try {
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(emailbody), headers: setHeaders());
      if (response.statusCode == 200) {
        var body = await jsonDecode(response.body);
        var detail = body['user'];
        return detail['division'];
      }
    } catch (e) {
      print(e);
    }
  }

  // get all ongoing campaigns details

  Future<List<Campaign>> getCampignDatails(BuildContext context) async {
    var divition = await getDivision(context);
    List<Campaign> campaigns = [];

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

        for (var dat in allData) {
          // if (tDate.isAfter(cDate)) {
          var name = dat['name'];
          var campaigndate = dat['date'];
          var time = dat['time'];
          var status = dat['status'].toString();
          var location = dat['location'];
        
          Campaign campaign =
              Campaign(name, campaigndate, time, status, location);

          campaigns.add(campaign);
        }

        // // debugPrint(campaigns.toString(
      }
    } catch (e) {
      print(e);
    }
    return campaigns;
  }
}
