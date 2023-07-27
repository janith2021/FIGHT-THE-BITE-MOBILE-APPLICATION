import 'package:client/widget/custom_card.dart';
import 'package:client/widget/custom_dialog_box.dart';
// import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../../const/all_imports.dart';

class UserDashboard extends StatefulWidget {
  static String get routename => "/user/dashboard";
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  Box? _users;
  String? _currentuser;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  openBox() async {
    await Hive.openBox('users');
    setState(() {
      _users = Hive.box('users');
      _currentuser = _users!.get('user');
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController vehicleNameController = TextEditingController();
    TextEditingController vehicleNumberController = TextEditingController();
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.lightgrey,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(0.2),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomCarousel(
                          autoplay: true,
                          height: MediaQuery.of(context).size.height * 0.3,
                          durationInSeconds: 1,
                          items: [
                            Container(
                              // height: MediaQuery.of(context).size.height * 0.3,
                              // width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                "Assets/villagers/dashboard/villager1.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              color: Colors.amber,
                              height: AllDimensions.px10,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Image.asset(
                                "Assets/villagers/dashboard/login2.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: AllDimensions.px10,
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Image.asset(
                                "Assets/villagers/dashboard/login3.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: AllDimensions.px10,
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Image.asset(
                                "Assets/villagers/dashboard/login4.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: AllDimensions.px10,
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Image.asset(
                                "Assets/villagers/dashboard/login5.png",
                                fit: BoxFit.cover,
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AllDimensions.px8),
                      child: Container(
                        height: AllDimensions.px168,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AllDimensions.px10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: AllDimensions.px10,
                                  color: AppColors.red)
                            ]),
                        child: Stack(
                          children: [
                            Image.asset("Assets/villagers/dashboard/affectedratebackground.png"),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    AllStrings.affectedrate,
                                    style: GoogleFonts.poppins(
                                        fontSize: AllDimensions.px18,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '123',
                                      style: GoogleFonts.poppins(
                                          fontSize: AllDimensions.px60,
                                          color: AppColors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '/1245',
                                      style: GoogleFonts.poppins(
                                          fontSize: AllDimensions.px25,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: AllDimensions.px168,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.red,
                                blurRadius: AllDimensions.px5,
                              )
                            ],
                            borderRadius:
                                BorderRadius.circular(AllDimensions.px10)),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset("Assets/villagers/dashboard/medalclothes.png"),
                                Image.asset("Assets/villagers/dashboard/competition.png")
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(AllDimensions.px15),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset("Assets/villagers/dashboard/coin.png"),
                                      Column(
                                        children: [
                                          Text(
                                            AllStrings.yourrank,
                                            style: GoogleFonts.poppins(
                                                fontSize: AllDimensions.px25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "278",
                                            style: GoogleFonts.poppins(
                                                fontSize: AllDimensions.px40,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.grey),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  CustomButton(
                                    bordercolor: AppColors.white,
                                    borderradius: AllDimensions.px50,
                                    boxcolor: AppColors.red,
                                    borderwidth: 0,
                                    text: AllStrings.play,
                                    styles: GoogleFonts.lato(
                                        fontSize: AllDimensions.px20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white),
                                    btnWidth: AllDimensions.px118,
                                    btnheight: AllDimensions.px34,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AllDimensions.px8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: AllDimensions.px5)],),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: AllDimensions.px5,
                              color: AppColors.red)
                        ]),
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AllDimensions.px10),
                                child: Image.asset(
                                    "Assets/villagers/dashboard/informaffectivity.png")),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AllDimensions.px40,
                                  top: AllDimensions.px10),
                              child: Text(
                                AllStrings.informbanner,
                                style: GoogleFonts.poppins(
                                  color: AppColors.black,
                                  fontSize: AllDimensions.px14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AllDimensions.px40,
                                  top: AllDimensions.px70),
                              child: Row(
                                children: [
                                  CustomButton(
                                    bordercolor: AppColors.white,
                                    borderradius: AllDimensions.px50,
                                    boxcolor: AppColors.red,
                                    borderwidth: 0,
                                    text: AllStrings.informaffectivity,
                                    styles: GoogleFonts.lato(
                                      fontSize: AllDimensions.px20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white,
                                    ),
                                    btnWidth: AllDimensions.px118,
                                    btnheight: AllDimensions.px34,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AllDimensions.px10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AllStrings.frequentlyused,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: AllDimensions.px18),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomCard(imageicon: "Assets/villagers/dashboard/labicon.png", cardname: AllStrings.labreports, textalign: TextAlign.center, maxline: 2, textstyle: GoogleFonts.poppins(fontSize: AllDimensions.px15),blurradius: AllDimensions.px10),
                        CustomCard(imageicon: "Assets/villagers/dashboard/channeldoctoricon.png", cardname: AllStrings.channeldoctors, textalign: TextAlign.center, maxline: 2, textstyle: GoogleFonts.poppins(fontSize: AllDimensions.px15),blurradius: AllDimensions.px10,)
                      ],
                    ),
                    SizedBox(
                      height: AllDimensions.px15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomCard(imageicon: "Assets/villagers/dashboard/campaignicon.png", cardname: AllStrings.campaigns, textalign: TextAlign.center, maxline: 2, textstyle: GoogleFonts.poppins(fontSize: AllDimensions.px15),blurradius: AllDimensions.px10,),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CustomDialogBox(
                                    dialogtitle: "Add Emergency Vehicles",
                                    controller1: vehicleNumberController,
                                    hintText1: "Enter Vehicle Name",
                                    iconData1: Icons.airport_shuttle,
                                    label1: "Vehicle Name",
                                    errorText1: "Please Enter Vehicle Name",submitBtnText: "Submit",cancelBtnText: "Cancel",submitbtncolor: AppColors.green,cancelbtncolor: AppColors.red,btntextstyle: GoogleFonts.poppins(color: AppColors.black,fontSize: AllDimensions.px20),));
                          },
                          child: CustomCard(imageicon: "Assets/villagers/dashboard/emergencyvehicleicon.png", cardname: AllStrings.emergency, textalign: TextAlign.center, maxline: 2, textstyle: GoogleFonts.poppins(fontSize: AllDimensions.px15,),blurradius: AllDimensions.px10),
                          
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}


