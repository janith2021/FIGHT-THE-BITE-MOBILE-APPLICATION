import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:client/widget/custom_card.dart';
import 'package:client/widget/custom_dialog_box.dart';
import 'package:flutter_app_rename/context.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_animated_button/flutter_animated_button.dart'
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

  Future<String> userdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString('user');
    debugPrint(data.toString());
    return data.toString();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controllername = TextEditingController();
    TextEditingController controllerage = TextEditingController();
    TextEditingController controllergender = TextEditingController();
    // TextEditingController controllergender = TextEditingController();
    // TextEditingController vehicleNumberController = TextEditingController();
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.lightgrey,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
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
                                      left: MediaQuery.of(context).size.width *
                                          0.1,
                                      top: AllDimensions.px25),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                        color: AppColors.red,
                                        borderRadius: BorderRadius.circular(
                                            AllDimensions.px10)),
                                    child: FutureBuilder(
                                        future: userdata(),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          return Center(
                                              child: Text(
                                            snapshot.data,
                                            style: GoogleFonts.poppins(
                                                color: AppColors.white,
                                                fontSize: AllDimensions.px20,
                                                fontWeight: FontWeight.bold),
                                          ));
                                        }),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/user/profile");
                                    // debugPrint("HI");
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return AlertDialog(
                                    //         title: Center(child: Text("User Profile",style: GoogleFonts.poppins(fontSize: AllDimensions.px18,fontWeight: FontWeight.bold),)),
                                    //         content: Column(
                                    //           mainAxisSize: MainAxisSize.min,
                                    //           children: [
                                    //             TextFormField(controller: controllergender,decoration: InputDecoration(label : Text("Name",style: GoogleFonts.poppins(fontSize: AllDimensions.px18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))),
                                    //             TextFormField(controller: controllergender,decoration: InputDecoration(label : Text("Email",style: GoogleFonts.poppins(fontSize: AllDimensions.px18,fontWeight: FontWeight.bold),)))
                                    //           ],
                                    //         ),
                                    //       );
                                    //     });
                                  },
                                  child: CircularProfileAvatar(
                                    "https://img.icons8.com/?size=512&id=NkdlSUR5LFuw&format=png",
                                    radius: AllDimensions.px40,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                                      context, "villager/notification");
                                },
                              )),
                          IconButton(
                              onPressed: () async {
                                ArtDialogResponse res = await ArtSweetAlert.show(
                                    barrierDismissible: false,
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                        title:
                                            "Are You Sure You want to Logout?",
                                        denyButtonText: "NO",
                                        confirmButtonText: "Yes",
                                        type: ArtSweetAlertType.danger));
                                if (res == null) {
                                  return;
                                }
                                if (res.isTapConfirmButton) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.clear();
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacementNamed(
                                      context, "/login");
                                  // ignore: use_build_context_synchronously
                                  ArtSweetAlert.show(
                                      barrierDismissible: false,
                                      context: context,
                                      artDialogArgs: ArtDialogArgs(title: "Success",text: "You have Successfully Logged out",type: ArtSweetAlertType.success));
                                }
                              },
                              icon: Icon(Icons.logout))
                        ],
                      ),
                    ),
                    SizeBox().sizedBox20,
                    CustomCarousel(
                        autoplay: true,
                        height: MediaQuery.of(context).size.height * 0.25,
                        durationInSeconds: 1,
                        items: [
                          Container(
                            // height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              "https://www.floreshospital.com/images/denguesysmp.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            // color: Colors.amber,
                            height: AllDimensions.px10,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              "https://cdn.newsfirst.lk/english-uploads/2022/02/022d312c-00f3fde4-7e48f0e8-dengue-_850x460_acf_cropped_850x460_acf_cropped.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: AllDimensions.px10,
                            // color: Colors.amber,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              "https://www.durdans.com/wp-content/uploads/2018/05/dengie.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: AllDimensions.px10,
                            // color: Colors.amber,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              "https://hometriangle.com/blogs/content/images/2022/10/cover-images--1-.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: AllDimensions.px10,
                            // color: Colors.amber,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              "https://www.who.int/images/default-source/searo---images/countries/sri-lanka/ecoesvxucaagm3e.jpg?sfvrsn=6e863c59_2",
                              fit: BoxFit.fill,
                            ),
                          )
                        ]),
                    SizeBox().sizedBox20,
                    Container(
                      height: AllDimensions.px200,
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
                          Image.asset(
                              "Assets/villagers/dashboard/affectedratebackground.png"),
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
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "villager/affectivity");
                                },
                                child: CustomButton(
                                  bordercolor: AppColors.white,
                                  borderradius: AllDimensions.px50,
                                  boxcolor: AppColors.red,
                                  borderwidth: 0,
                                  text: AllStrings.seemore,
                                  styles: GoogleFonts.lato(
                                    fontSize: AllDimensions.px20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                  btnWidth: AllDimensions.px118,
                                  btnheight: AllDimensions.px34,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizeBox().sizedBox10,
                    Container(
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
                              Image.asset(
                                  "Assets/villagers/dashboard/medalclothes.png"),
                              Image.asset(
                                  "Assets/villagers/dashboard/competition.png")
                            ],
                          ),
                          SizeBox().sizedBox10,
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                      "Assets/villagers/dashboard/coin.png"),
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
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "villager/leaderboard");
                                },
                                child: CustomButton(
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
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizeBox().sizedBox10,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: AllDimensions.px5)],),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: AllDimensions.px5, color: AppColors.red)
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
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/villager/inform/affected2");
                                  },
                                  child: CustomButton(
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
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, "/villager/laboratory");
                          },
                          child: CustomCard(
                              imageicon:
                                  "Assets/villagers/dashboard/labicon.png",
                              cardname: AllStrings.labreports,
                              textalign: TextAlign.center,
                              maxline: 2,
                              textstyle: GoogleFonts.poppins(
                                  fontSize: AllDimensions.px15),
                              blurradius: AllDimensions.px10,
                              boxcolor: AppColors.white),
                        ),
                        CustomCard(
                          imageicon:
                              "Assets/villagers/dashboard/channeldoctoricon.png",
                          cardname: AllStrings.channeldoctors,
                          textalign: TextAlign.center,
                          maxline: 2,
                          textstyle:
                              GoogleFonts.poppins(fontSize: AllDimensions.px15),
                          blurradius: AllDimensions.px10,
                          boxcolor: AppColors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: AllDimensions.px15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/villager/campaigns");
                          },
                          child: CustomCard(
                            imageicon:
                                "Assets/villagers/dashboard/campaignicon.png",
                            cardname: AllStrings.campaigns,
                            textalign: TextAlign.center,
                            maxline: 2,
                            textstyle: GoogleFonts.poppins(
                                fontSize: AllDimensions.px15),
                            blurradius: AllDimensions.px10,
                            boxcolor: AppColors.white,
                          ),
                        ),
                        InkWell(
                          // onTap: () {
                          //   showDialog(
                          //       context: context,
                          //       builder: (context) => CustomDialogBox(
                          //             dialogtitle: "Add Emergency Vehicles",
                          //             controller1: vehicleNumberController,
                          //             hintText1: "Enter Vehicle Name",
                          //             iconData1: Icons.airport_shuttle,
                          //             label1: "Vehicle Name",
                          //             errorText1: "Please Enter Vehicle Name",
                          //             submitBtnText: "Submit",
                          //             cancelBtnText: "Cancel",
                          //             submitbtncolor: AppColors.green,
                          //             cancelbtncolor: AppColors.red,
                          //             btntextstyle: GoogleFonts.poppins(
                          //                 color: AppColors.black,
                          //                 fontSize: AllDimensions.px20),
                          //           ));
                          // },
                          child: CustomCard(
                            imageicon:
                                "Assets/villagers/dashboard/patientdetails.png",
                            cardname: AllStrings.patientdetails,
                            textalign: TextAlign.center,
                            maxline: 2,
                            textstyle: GoogleFonts.poppins(
                              fontSize: AllDimensions.px15,
                            ),
                            blurradius: AllDimensions.px10,
                            boxcolor: AppColors.white,
                          ),
                        )
                      ],
                    ),
                    SizeBox().sizedBox20,
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
