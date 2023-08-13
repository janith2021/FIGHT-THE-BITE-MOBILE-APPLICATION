import 'package:shared_preferences/shared_preferences.dart';

import '../const/all_imports.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;

class CreateCampaignProvider extends ChangeNotifier {

// final SharedPreferences prefer = await SharedPreferences.getInstance();

  List<DateTime> ongoingCampaignDates = []; // Replace with actual data
  DateTime selectedDate = DateTime.now();

  // Get relevant organization division

   getDivision(BuildContext context) async {

    final SharedPreferences prefer = await SharedPreferences.getInstance();
    var email = await prefer.getString('user');

    // var fullurl = '${AllStrings.baseurl}/organization/view?email=$email';
    var fullurl = '${AllStrings.baseurl}/organization/view';
      debugPrint(fullurl);
      setHeaders() =>
          {'Content-Type': 'application/json', 'Accept': 'application/json'};

         var data ={
          'email' : email,
         };

      try {
        var response = await http.post(Uri.parse(fullurl),
          body : jsonEncode(data),
          headers: setHeaders());
        if (response.statusCode == 200) {
          var body = await jsonDecode(response.body);

          var Detail = body['user'];

          // debugPrint(body['user']);
          debugPrint(Detail['division']);
          // return body; 
        }
      
      } catch (e) {

        // print(e); 
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