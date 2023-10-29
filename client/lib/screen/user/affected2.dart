import 'package:client/const/all_imports.dart';
import 'package:client/models/User.dart';
import 'package:client/providers/symptomsinform.dart';
import 'package:client/widget/custom_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// class AffectPerson extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SymptomCheckScreen(),
//     );
//   }
// }

class SymptomCheckScreen extends StatefulWidget {
  static String get routename => "/villager/inform/affected2";
  @override
  _SymptomCheckScreenState createState() => _SymptomCheckScreenState();
}

class _SymptomCheckScreenState extends State<SymptomCheckScreen> {
  List<User> users = [];
  // List of affected persons
  List<String> affectedPersons = [
    'Nimali Wasana',
    'Kamali Perera',
    'Ushani Dilini',
    'Jagath Perera',
    'Nayomi Lakshi',
  ];

  // List of symptoms
  List<String> symptoms = [
    'Fever',
    'Headache',
    'Joint Pain',
    'Nausea',
    'Vomiting',
  ];

  Future<List<User>> getmembers() async {
    users.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var houseHoldNo = prefs.getString('householdno');
    // debugPrint(houseHoldNo);
    var body = {'houseHoldNo': prefs.getString('householdno')};
    var fullUrl = "${AllStrings.baseurl}/villager/getfamilymembers";
    debugPrint(fullUrl);
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};
    var res = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(body), headers: setHeaders());
    var result = await jsonDecode(res.body);
    // debugPrint(result['message'].toString());
    for (var dat in result['message']) {
      var name = dat['name'];
      var nic = dat['nic'];
      // debugPrint(name);
      User familymember = User(name: name, nic: nic);
      users.add(familymember);
    }
    // debugPrint(users.toString());
    return users;
    // debugPrint(result.toString());
  }

  // Map to store selected symptoms for each person
  Map<String, Set<String>> personSymptoms = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: const BackButton(),
        title: Text(
          AllStrings.informaffect,
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getmembers(),
          builder: ((context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else {
              if (snapshot.hasError) {
                return Expanded(child: Text(snapshot.error.toString()));
              } else {
                var item = snapshot.data;
                debugPrint(item.toString());
                return ListView.builder(
                    itemCount: item!.length,
                    itemBuilder: (context, index) {
                      var data = item[index];
                      return Padding(
                        padding: EdgeInsets.all(AllDimensions.px20),
                        child: ListTile(
                          tileColor: AppColors.lightgrey,
                          minVerticalPadding: AllDimensions.px10,
                          leading: Text(
                            data.name.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: AllDimensions.px25),
                          ),
                          trailing: InkWell(
                              onTap: () {
                                dialogbox(data);
                              },
                              child: CustomButton(
                                bordercolor: Colors.red,
                                borderradius: AllDimensions.px10,
                                boxcolor: Colors.red,
                                borderwidth: AllDimensions.px10,
                                text: "Inform",
                                styles: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold),
                                btnWidth: AllDimensions.px100,
                                btnheight: AllDimensions.px40,
                              )),
                        ),
                      );
                    });
              }
            }
          })),
    );
  }

  Future dialogbox(User data) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer<SymptomsinformProvider>(
            builder: (context,provider,_) {
              return AlertDialog(
                title: Text("Symptoms Check",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.cyan,decoration: TextDecoration.underline),textAlign: TextAlign.center),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${data.name}, Please Mark Your Symptoms below.",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                    SizedBox(height: AllDimensions.px10,),
                    CustomTextField(controller: provider.controllercomments, hintText: "Additional Comments", iconData: Icons.comment, label: "Additional Comments", errorText: "Error")
                  ],
                ),
              );
            }
          );
        });
  }
}
