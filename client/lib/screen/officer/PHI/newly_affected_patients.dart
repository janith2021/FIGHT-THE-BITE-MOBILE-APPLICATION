import 'package:client/models/Patient.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../const/all_imports.dart';

import 'package:http/http.dart' as http;

class NewlyAffectedPatients extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  List<Patient> patients = [];
  static String get routename => "/phi/newlyaffectedpatients";
  NewlyAffectedPatients({super.key});

  @override
  Future<List<Patient>> getNewlyPatientCount() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var email = prefer.getString("user");
    var body = {"affectedStatus": 1, "email": email};
    var fullurl = "${AllStrings.baseurl}/patient/getpatient";
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};
    var results = await http.post(Uri.parse(fullurl),
        body: jsonEncode(body), headers: setHeaders());

    // if(results.statusCode == 200){
    var result = jsonDecode(results.body);
    // debugPrint(result['patientsList'].toString());
    var data = result['patientsList'];

    for (var patient in data) {
      // int lengths = patient.lenght;
      // print(lengths);
      //
      for (var data in patient) {
        // print(data);
        var id = data['_id'];
        var name = data['name'];
        // print(name);
        var address = data['address'];
        var wardId = data['wardId'];
        var phase = data['phase'].toString();
        var houseHoldNo = data['houseHoldNo'];
        var divisionNo = data['divisionNo'];
        Patient p = Patient(
            id: id,
            address: address,
            wardId: wardId,
            name: name,
            phase: phase,
            divisionNo: divisionNo,
            houseHoldNo: houseHoldNo);
        patients.add(p);
      }
    }
    // }
    return patients;
  }

  void _submitData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.getString('id').toString();
    // print(id);
    // print(_textEditingController.text);

    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var fullurl = '${AllStrings.baseurl}/phi/addtoalready';

    var body = {
      'userId': id,
      'affectedStatus': 2,
      'phicomment': _textEditingController.text
    };

    try {
      var response =
          http.post(Uri.parse(fullurl), body: jsonEncode(body), headers: setHeaders());

      // if (response.statusCode == 200) {
      //   print('User updated successfully');
      //   Navigator.of(context).pop();
      // } else {
      //   print('Failed to update user');
      // }
    } catch (e) {
      print(e);
    }
  }

  Future awshowDialogBox(context, id, name, address, houseHoldNo, divisionNo,
      wardId, phase) async {
    return showDialog(
        context: context,
        builder: (Builder) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: AlertDialog(
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: AppColors.white),
                // width: MediaQuery.of(context).size.width * 0.8,
                // height: MediaQuery.of(context).size.height * 0.45,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 230),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.close_rounded,
                                size: 35,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Text(
                            "Patient Details",
                            style: GoogleFonts.poppins(
                                fontSize: AllDimensions.px20,
                                color: AppColors.lightred,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          "Name : ${name}",
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Address : ${address}",
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "House Holder Number : ${houseHoldNo}",
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Division Number : ${divisionNo}",
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Ward Number : ${wardId}",
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Phase : ${phase}",
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 5, right: 20),
                          child: TextFormField(
                            controller: _textEditingController,
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return "Enter the note";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter the Comment',
                                labelText: 'PHI Comment'),
                          )),
                    ],
                  ),
                ),

                actions: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, right: 15),
                    child: TextButton(
                        onPressed: () {
                          _submitData(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Text(
                            "Submit",
                            style: GoogleFonts.poppins(
                                fontSize: AllDimensions.px18),
                          ),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.lightred,
                            primary: AppColors.white)),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightred,
        title: Text(
          "Newly Affected Patients",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AllDimensions.px20),
        child: FutureBuilder(
            future: getNewlyPatientCount(),
            builder: (context, AsyncSnapshot<List<Patient>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200], // Background color
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.lightred), // Indicator color
                  strokeWidth: 4, // Thickness of the indicator
                ));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error : ${snapshot.hasError.toString()}"),
                );
              } else {
                var list = snapshot.data;
                // debugPrint(list);
                return ListView.builder(
                  itemCount: list!.length,
                  itemBuilder: (context, index) {
                    var item = list[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: AllDimensions.px10),
                      child: ListTile(
                        title: Text(
                          item.name,
                          style: GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        tileColor: const Color.fromARGB(255, 233, 226, 204),
                        leading: const Icon(
                          Icons.account_circle,
                          size: 40,
                        ),
                        trailing: IconButton(
                            onPressed: () async {
                              await awshowDialogBox(
                                  context,
                                  item.id,
                                  item.name,
                                  item.address,
                                  item.houseHoldNo,
                                  item.divisionNo,
                                  item.wardId,
                                  item.phase);
                            },
                            icon: const Icon(
                              Icons.read_more,
                              size: 30,
                            )),
                        subtitle: Text(
                          item.address,
                          style: GoogleFonts.poppins(),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                          // side: BorderSide(
                          //     color:AppColors.lightred, width: 2), // Border
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    ));
  }
}
