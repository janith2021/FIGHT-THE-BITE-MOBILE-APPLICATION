// import 'dart:ffi';
// import 'dart:html';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:client/const/all_imports.dart';
import 'package:client/widget/custom_card.dart';
import 'package:http/http.dart' as http;
import 'package:one_clock/one_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:circula';

class OrganizationDashboard extends StatefulWidget {
  static String get routename => "/organization/dashboard";
  const OrganizationDashboard({super.key});

  @override
  State<OrganizationDashboard> createState() => _OrganizationDashboardState();
}

class _OrganizationDashboardState extends State<OrganizationDashboard> {
  Future<Map<dynamic, dynamic>> getuser() async {
    // var box = Hive.box('users');
    // var email = box.get('user');
    // print(email);
    SharedPreferences prefer = await SharedPreferences.getInstance();
    final String? email = prefer.getString('user');
    debugPrint(email);
    var url = '${AllStrings.baseurl}/organization/view';
    var data = {
      "email": email,
    };
    setHeaders() => {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };
    var res = await http.post(Uri.parse("${AllStrings.baseurl}/user"),
        body: jsonEncode(data), headers: setHeaders());
    Map users = await jsonDecode(res.body);
    prefer.setString("userid", users["user"]["_id"]);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Positioned(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // FutureBuilder(
                        //     future: getuser(),
                        //     builder: (BuildContext context,
                        //         AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
                        //       if (snapshot.connectionState ==
                        //           ConnectionState.waiting) {
                        //         return Container();
                        //       } else {
                        //         if (snapshot.hasError) {
                        //           return Text(
                        //               "There is an error : ${snapshot.error}");
                        //         }
                        //         final data = snapshot.data!["user"];
                        //         print(data);
                        //         // print(data);
                        //         return Stack(
                        //           alignment: Alignment.centerLeft,
                        //           children: [
                        //             Container(
                        //               margin: EdgeInsets.only(
                        //                   left: AllDimensions.px70),
                        //               width: MediaQuery.of(context).size.width *
                        //                   0.6,
                        //               height: AllDimensions.px30,
                        //               decoration: BoxDecoration(
                        //                   color: AppColors.red,
                        //                   borderRadius: BorderRadius.circular(
                        //                       AllDimensions.px50)),
                        //               child: Padding(
                        //                 padding: const EdgeInsets.all(5.0),
                        //                 child: Text(
                        //                     data["name"] ??
                        //                         CircularProgressIndicator
                        //                             .adaptive(),
                        //                     style: GoogleFonts.aBeeZee(
                        //                       color: AppColors.white,
                        //                       fontSize: AllDimensions.px20,
                        //                     ),
                        //                     textAlign: TextAlign.center,
                        //                     maxLines: 2,
                        //                     overflow: TextOverflow.visible),
                        //               ),
                        //             ),
                        //             CircularProfileAvatar(
                        //               data["image"] ??
                        //                   CircularProgressIndicator.adaptive(),
                        //               imageFit: BoxFit.contain,
                        //             ),
                        //           ],
                        //         );
                        //       }
                        //     })
                      ],
                    ),
                  ),
                  SizeBox().sizedBox20,
                  DigitalClock(
                    showSeconds: true,
                    datetime: DateTime.now(),
                    isLive: true,
                    textScaleFactor: AllDimensions.px2,
                    digitalClockTextColor: AppColors.black,
                    padding: EdgeInsets.all(AllDimensions.px10),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(AllDimensions.px10),
                        boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)]),
                  ),
                  SizeBox().sizedBox20,
                  CustomCarousel(autoplay: true, durationInSeconds: 1, items: [
                    Container(
                        child: Image.asset(
                      // "https://img.freepik.com/free-vector/business-people-entrepreneur_24877-63439.jpg?w=740&t=st=1691012089~exp=1691012689~hmac=e19ad348a23ac51ef8429a0af30001f0c07d1d322092645e05f57f5abe1ad12b",
                      "Assets/Login/login1.png",
                      fit: BoxFit.fill,

                      width: MediaQuery.of(context).size.width,
                    )),
                    Container(
                        child: Image.asset(
                      "Assets/Login/login2.png",
                      // "https://img.freepik.com/free-vector/businesspeople-office-with-e-mail-marketing-icons_24877-51302.jpg?w=740&t=st=1691012135~exp=1691012735~hmac=cb3dbf696cb8e486d33e45d4acd72cd9cc6b3230102fbf4c305fb8dcf2a50771",
                      // "https://img.freepik.com/free-vector/lazy-unorganized-office-people-causing-mess-problems-funny-chaotic-characters-computer-desks-flat-vector-illustration-conflict-chaos-workplace-organization-concept-banner_74855-24289.jpg?w=1060&t=st=1691492380~exp=1691492980~hmac=73faa2dc5173a9bb2f9870442d4c73675c84952ac059b33391c939b94fb29d45",
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    )),
                  ]),
                  SizeBox().sizedBox20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "organization/create");
                        },
                        child: CustomCard(
                          imageicon:
                              "Assets/organization/dashboard/createcampaign.png",
                          cardname: AllStrings.createcampaign,
                          blurradius: AllDimensions.px10,
                          textalign: TextAlign.center,
                          maxline: 2,
                          textstyle: GoogleFonts.aBeeZee(
                              fontSize: AllDimensions.px20,
                              fontWeight: FontWeight.bold),
                          boxcolor: AppColors.yellow,
                        ),
                      ),
                      CustomCard(
                        imageicon:
                            "Assets/organization/dashboard/ongoingcampaign.png",
                        cardname: AllStrings.ongoingcampaign,
                        textalign: TextAlign.center,
                        maxline: 3,
                        textstyle: GoogleFonts.aBeeZee(
                            fontSize: AllDimensions.px20,
                            fontWeight: FontWeight.bold),
                        boxcolor: AppColors.yellow,
                        blurradius: AllDimensions.px10,
                      )
                    ],
                  ),
                  SizeBox().sizedBox20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomCard(
                          imageicon:
                              "Assets/organization/dashboard/sponsorcampaign.png",
                          cardname: AllStrings.sponsorcampaign,
                          textalign: TextAlign.center,
                          blurradius: AllDimensions.px10,
                          maxline: 3,
                          textstyle: GoogleFonts.aBeeZee(
                              fontSize: AllDimensions.px20,
                              fontWeight: FontWeight.bold),
                          boxcolor: AppColors.yellow),
                      CustomCard(
                        imageicon: "Assets/villagers/dashboard/labicon.png",
                        cardname: "Sponsor For Campaigns",
                        textalign: TextAlign.center,
                        maxline: 3,
                        textstyle: GoogleFonts.poppins(
                            fontSize: AllDimensions.px15,
                            fontWeight: FontWeight.bold),
                        boxcolor: AppColors.yellow,
                        blurradius: AllDimensions.px10,
                      )
                    ],
                  ),
                  SizeBox().sizedBox20,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
