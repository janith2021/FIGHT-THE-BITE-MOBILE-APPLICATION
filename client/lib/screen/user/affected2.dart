import 'package:client/const/all_imports.dart';
import 'package:client/models/User.dart';
import 'package:client/providers/symptomsinform.dart';
import 'package:client/widget/custom_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect_formfield/multiselect_formfield.dart';
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
    // debugPrint(result.toString());
    for (var dat in result['message']) {
      var name = dat['name'];
      var nic = dat['nic'];
      var contact = dat['contact'];
      // var divisionNumber = dat['']
      debugPrint(contact);
      User familymember = User(name: name, nic: nic, contact: contact);
      users.add(familymember);
    }
    debugPrint(users.toString());
    return users;
    // debugPrint(result.toString());
  }

  // Map to store selected symptoms for each person
  Map<String, Set<String>> personSymptoms = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                if (item!.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?w=996&t=st=1698588954~exp=1698589554~hmac=822df2331f98561ff280f677fc197f7cdc5486c9989f160c707ebfd7093a6e62"),
                      Padding(
                        padding: EdgeInsets.all(AllDimensions.px10),
                        child: Text("No Family Members Found",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: AllDimensions.px18),textAlign: TextAlign.center,),
                      )
                    ],
                  );
                }
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
              builder: (context, provider, _) {
            return AlertDialog(
              title: Text("Symptoms Check",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                      decoration: TextDecoration.underline),
                  textAlign: TextAlign.center),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Text("${data.name}, Please Mark Your Symptoms below.",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                  MultiSelectFormField(
                    autovalidate: AutovalidateMode.disabled,
                    chipBackGroundColor: AppColors.red,
                    chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                    dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                    checkBoxActiveColor: Colors.red,
                    checkBoxCheckColor: AppColors.bgwhite,
                    dialogShapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    title: Text(
                      "Select Symptoms",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    dataSource: [
                      {'display': 'Fever', 'value': 'Fever'},
                      {'display': 'Headache', 'value': 'Headache'},
                      {'display': 'Pain in Eyes', 'value': 'Pain in Eyes'},
                      {'display': 'Muscle Pain', 'value': 'Muscle Pain'},
                      {'display': 'Bone Pain', 'value': 'Bone Pain'},
                      {'display': 'Red Spots', 'value': 'Red Spots'},
                    ],
                    textField: 'display',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    hintWidget: Text(
                      "Please Select one or more Symptoms",
                      style: GoogleFonts.poppins(color: AppColors.red),
                    ),
                    onSaved: (newValue) {
                      provider.symptoms = newValue;
                    },
                  ),
                  Text(
                    provider.symptomerror,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, color: AppColors.red),
                  ),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllercomments,
                      hintText: "Others",
                      iconData: Icons.comment,
                      label: "Other",
                      errorText: ""),

                  SizedBox(
                    height: AllDimensions.px20,
                  ),
                  InkWell(
                      onTap: () {
                        provider.symptomsinform(data, context);

                        // if (provider.symptomsinform(data, context)) {
                        //   getmembers();
                        // }
                        // setState(() {

                        // });
                      },
                      child: CustomButton(
                          bordercolor: AppColors.red,
                          borderradius: AllDimensions.px10,
                          boxcolor: AppColors.red,
                          borderwidth: AllDimensions.px10,
                          text: "Inform Affectivity",
                          styles:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                          btnWidth: MediaQuery.of(context).size.width))
                ],
              ),
            );
          });
        });
  }
}
