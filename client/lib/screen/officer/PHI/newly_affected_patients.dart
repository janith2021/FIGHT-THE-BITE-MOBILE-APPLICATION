import 'package:client/models/Patient.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../const/all_imports.dart';

import 'package:http/http.dart' as http;

class NewlyAffectedPatients extends StatelessWidget {
  List<Patient> patients = [];
  static String get routename => "/phi/newlyaffectedpatients";
  NewlyAffectedPatients({super.key});

  @override

  Future<List<Patient>> getNewlyPatientCount() async {
   
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var email = prefer.getString("user");
    var body = {
      "affectedStatus" : 2,
       "email" : email
    };
    var fullurl = "${AllStrings.baseurl}/patient/getpatient";
    setHeaders() =>
          {'Content-Type': 'application/json', 'Accept': 'application/json'};
    var results = await http.post(Uri.parse(fullurl),body: jsonEncode(body),headers: setHeaders());
    
    // if(results.statusCode == 200){
      var result = jsonDecode(results.body);
      // debugPrint(result['patientsList'].toString());
      var data = result['patientsList'];
      // print(data);
      for(var patient in data){
        var id = patient[0]['_id']; 
        var address = patient[0]['address']; 
        var wardId = patient[0]['wardId']; 
        Patient p = Patient(id, address, wardId);
        patients.add(p);
      }
    // }
    return patients;

  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightred,
          title: Text("Newly Affected Patients",
          style: GoogleFonts.poppins(),),
        ),
        body: Padding(
          padding: EdgeInsets.all(AllDimensions.px20),
          child: FutureBuilder(
            future: getNewlyPatientCount(),
            builder: (context, AsyncSnapshot<List<Patient>> snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }else if(snapshot.hasError){
                return Center(
                  child: Text("Error : ${snapshot.hasError.toString()}"),
                );
              }else{
                var list = snapshot.data;
                // debugPrint(list);
                return ListView.builder(itemCount: list!.length,itemBuilder: (context, index) {
                  var item = list[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: AllDimensions.px10),
                    child: ListTile(
                      tileColor: AppColors.cream,
                      leading: Text(item.id),
                      trailing: Text(item.address),
                    ),
                  );
                },);
              }
            }),
        ),
      ));
  }
}