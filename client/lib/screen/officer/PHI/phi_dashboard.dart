import 'dart:ffi';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../const/all_imports.dart';

class PHIDashBoard extends StatefulWidget {
  static String get routename => "/officer/phi/dashboard";
  const PHIDashBoard({super.key});

  @override
  State<PHIDashBoard> createState() => _PHIDashBoardState();
}

class _PHIDashBoardState extends State<PHIDashBoard> {
  Box? _userbox;
  String? _user;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openBox();
  }

  // userData

  openBox() async {
    await Hive.openBox('users');

    setState(() {
      _userbox = Hive.box('users');
      _user = _userbox!.get('user');
    });
  }

  Future getNAme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = await prefs.getString('userName').toString();
    return name;
  }

  Future getDivitions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = await prefs.getString('user').toString();

    var body = {'email': email};
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var fullurl = '${AllStrings.baseurl}/phi/getdivition';

    late var division;

    try {
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(body), headers: setHeaders());

      if (response.statusCode == 200) {
        // debugPrint("Hello");
        var resBody = await jsonDecode(response.body);
        // debugPrint(resBody.toString());
        division = resBody['message']['gsDivisions'];

        // debugPrint(division.toString());
      }
    } catch (e) {
      print(e);
    }
    return division;
  }

  // Future newlyAddedPatientCount() async {

  //   setHeaders() =>
  //       {'Content-Type': 'application/json', 'Accept': 'application/json'};

  //   var fullurl = '${AllStrings.baseurl}/patient/getPatientcount';
  // }

  Future<int> newlyAddedPatients(var division) async {
    late int lenght;

    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var fullurl = '${AllStrings.baseurl}/patient/getPatient';

    List phiDivisions = await getDivitions();


    var affectedStatus = {'affectedStatus': 1, 'divisionNumber': division};
    try {
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(affectedStatus), headers: setHeaders());

      // debugPrint(response.toString());

      if (response.statusCode == 201) {
        var body = jsonDecode(response.body);
        List patients = body['message'];
        // print(patients.toString().length);

        lenght = patients.length;
        // print(lenght);
      }
    } catch (e) {
      print(e);
    }
    return lenght;
  }

  Future<int> getAlreadyAddedPatients() async {
    late int lenght;
    var count = 0;
  //  late int totalAlready;

    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var fullurl = '${AllStrings.baseurl}/patient/getPatient';

    List phiDivisions = await getDivitions();
    // print(phiDivisions);

    phiDivisions.forEach((division) async {
      
      var affectedStatus = {'affectedStatus': 2, 'divisionNumber': division};
    try {
      // print("Hello"); 
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(affectedStatus), headers: setHeaders());
      //  print("Hello");   
      if (response.statusCode == 201) {
        var body = await jsonDecode(response.body);
        
        List patients = body['message'];
        
        lenght = patients.length.toInt();
        // totalAlready = totalAlready + lenght;  
        

        count = count + lenght;
        // print("My Count $count");
        // print(division);
        // print(lenght);
      }

    } catch (e) {
      print(e);
    }
     });
    // print(totalAlready);
    // Future.delayed(const Duration(seconds: 10000000000000000),(){
    //   print(count);
    //   return count;
    // });
    
    return lenght;
  }

  Future getPatientCount() async {
    List count = [];

    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var fullurl = '${AllStrings.baseurl}/patient/getPatient';

    List phiDivisions = await getDivitions();
    // print(phiDivisions);

    // get newly added patients
    // late int newly;
    // phiDivisions.forEach((division) async {
    //   // print(division);
    //   var nCount = 0;
    //   nCount = await newlyAddedPatients(division);
    //   newly = newly + nCount;
    // });

    // // get already added patients
    // late int already;
    // phiDivisions.forEach((division) async {
    //   // print(division);
    //   var alradyCount = 0;
    //   alradyCount = await newlyAddedPatients(division);
    //   already = already + alradyCount;
    // });

    // int newly = await newlyAddedPatients();
    // debugPrint(newly.toString());
    // int already = await getAlreadyAddedPatients();
    // count.add(newly);
    // count.add(already);

    // debugPrint(count.toString());
    return count;
  }

  Future getAllPatient() async {
    List patient = [230, 2500];

    return patient;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.lightgrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: getNAme(),
                builder: (context, AsyncSnapshot snapshot) {
                  return Padding(
                    padding: EdgeInsets.all(AllDimensions.px10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(AllDimensions.px10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        top: AllDimensions.px25),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius: BorderRadius.circular(
                                              AllDimensions.px10)),
                                      child: Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            left: AllDimensions.px25),
                                        child: Text(
                                          snapshot.data,
                                          style: GoogleFonts.poppins(
                                            color: AppColors.white,
                                            fontSize: AllDimensions.px20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )),
                                    ),
                                  ),
                                  CircularProfileAvatar(
                                    "https://img.icons8.com/?size=512&id=NkdlSUR5LFuw&format=png",
                                    radius: AllDimensions.px40,
                                  )
                                ],
                              )),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: AllDimensions.px20),
                                  child: IconBadge(
                                    icon: Icon(
                                      Icons.notifications_rounded,
                                      size: AllDimensions.px50,
                                      color: AppColors.red,
                                    ),
                                    itemCount: 5,
                                    hideZero: true,
                                    itemColor: Colors.white,
                                    badgeColor: AppColors.black,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "phi/notification");
                                    },
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
            Column(
              children: [
                // Text(snapshot.data[0].toString()),
                // Text(snapshot.data[1].toString()),
                Container(
                  height: height * 0.35,
                  // color: AppColors.black,
                  child: Padding(
                    padding: EdgeInsets.all(AllDimensions.px20),
                    child: Stack(
                      children: [
                        Image.asset(
                          'Assets/phi/phi_dashboard/image1.png',
                          height: height * 0.45,
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: AllDimensions.px20),
                                child: Text("Affected Villagers",
                                    style: GoogleFonts.poppins(
                                        fontSize: AllDimensions.px18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 20),
                                      child: Container(
                                        width: width * 0.8,
                                        height: height * 0.08,
                                        // color: AppColors.black,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    AllDimensions.px10),
                                            color: AppColors.lighorange),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          AllDimensions.px3),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: AllDimensions.px20),
                                        child: Container(
                                          width: width * 0.55,
                                          height: height * 0.071,
                                          // color: AppColors.black,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    AllDimensions.px10),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Newly Affected Patients",
                                            style: GoogleFonts.poppins(
                                                fontSize:
                                                    AllDimensions.px14,
                                                fontWeight:
                                                    FontWeight.w500),
                                          )),
                                        ),
                                      ),
                                    ),
                                    FutureBuilder(
                                      // future: newlyAddedPatients(),
                                      builder: (context , AsyncSnapshot snapshot) {
                                        return Positioned(
                                          left: 260,
                                          top: 35,
                                          child: Text(
                                            snapshot.data[0].toString(),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: AllDimensions.px25,
                                                color: Color.fromARGB(
                                                    255, 244, 241, 241)),
                                          ),
                                        );
                                      }
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 25),
                                      child: Container(
                                        width: width * 0.8,
                                        height: height * 0.08,
                                        // color: AppColors.black,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    AllDimensions.px10),
                                            color: AppColors.lightred),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          AllDimensions.px3),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(top: 25.5),
                                        child: Container(
                                          width: width * 0.55,
                                          height: height * 0.071,
                                          // color: AppColors.black,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    AllDimensions.px10),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Already Affected Patients",
                                            style: GoogleFonts.poppins(
                                                fontSize:
                                                    AllDimensions.px14,
                                                fontWeight:
                                                    FontWeight.w500),
                                          )),
                                        ),
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: getAlreadyAddedPatients(),
                                      builder: (context , AsyncSnapshot snapshot) {
                                        return Positioned(
                                          left: 260,
                                          top: 40,
                                          child: Text(
                                            snapshot.toString(),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: AllDimensions.px25,
                                                color: Color.fromARGB(
                                                    255, 244, 241, 241)),
                                          ),
                                        );
                                      }
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            FutureBuilder(
                future: getAllPatient(),
                builder: (context, AsyncSnapshot snapshot) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: width * 0.9,
                      height: height * 0.22,
                      // color: AppColors.black,
                      decoration: BoxDecoration(
                          color: AppColors.lightred,
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Container(
                            width: width * 0.6,
                            height: height * 0.22,
                            // color: AppColors.cream,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AllDimensions.px25),
                                    child: Text(
                                      "Affected Rate",
                                      style: GoogleFonts.poppins(
                                          fontSize: AllDimensions.px18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(snapshot.data[0].toString()),
                                  // Text(snapshot.data[1].toString())
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
