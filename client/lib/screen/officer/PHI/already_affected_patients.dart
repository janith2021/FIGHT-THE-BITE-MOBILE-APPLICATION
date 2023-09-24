import 'package:client/const/all_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/Patient.dart';
import 'package:http/http.dart' as http;

class AlreayAffectedPatient extends StatelessWidget {
  List<Patient> patients = [];
  static String get routename => "/phi/alreadyaffectedpatients";
  AlreayAffectedPatient({super.key});

  @override
  Future<List<Patient>> getNewlyPatientCount() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var email = prefer.getString("user");
    var body = {"affectedStatus": 2, "email": email};
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

        // print(phase);
        var divisionNumber = data['divisionNumber'];
        var houseHoldNo = data['houseHoldNo'];
        var phicomment = data['phicomment'];
        Patient p = Patient(
            id: id,
            address: address,
            wardId: wardId,
            name: name,
            phase: phase,
            divisionNo: divisionNumber,
            houseHoldNo: houseHoldNo,
            phicomment: phicomment);
        patients.add(p);
      }
    }
    // }
    return patients;
  }

  Future showPatientDetails(context, name, address, wardId, phase, divisionNo,
      houseHoldNo, String? phicomment) async {
    // late String Phase;

    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 260,top: 5),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close_rounded,
                              size: 35,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Patient Details",
                          style: GoogleFonts.poppins(
                              fontSize: AllDimensions.px20,
                              color: AppColors.lightred,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(
                        "Name : $name",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(
                        "Address : ${address}",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(
                        "House Holder Number : ${houseHoldNo}",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(
                        "Division Number : ${divisionNo}",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(
                        "Ward Number : ${wardId}",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5),
                      child: Text(
                        "Phase : ${phase}",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                    Center(
                      child: Text("Note", style: GoogleFonts.poppins(
                        fontSize: AllDimensions.px18,
                        fontWeight: FontWeight.w600
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5,right: 20,top: 5),
                      child: Text(phicomment!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightred,
        title: Text(
          "Alredy Affected Patients",
          style: GoogleFonts.poppins(),
        ),
        elevation: 5,
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
                        tileColor: Color.fromARGB(255, 233, 226, 204),
                        leading: Icon(Icons.account_circle,size: 40,),
                        trailing: IconButton(
                            onPressed: () async {
                              late String? Phase;
                              item.phase == "1" ? Phase = "Febril Phase" : (item.phase == "2" ? Phase="Critical Phase":Phase = "During Shock");
                              // if (item.phase == 1) {
                              //   var Phase = "Febrile Phase Patients";
                              // } else if (item.phase == 2) {
                              //   var Phase = "Critical Phase";
                              // } else {
                              //   var Phase = "During Shock Phase";
                              // }
                    
                              await showPatientDetails(
                                  context,
                                  item.name,
                                  item.address,
                                  item.wardId,
                                  Phase,
                                  item.divisionNo,
                                  item.houseHoldNo,
                                  item.phicomment);
                            },
                            icon: Icon(Icons.read_more , size: 30,)),
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
