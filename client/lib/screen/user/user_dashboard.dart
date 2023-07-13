import 'package:flutter_animated_button/flutter_animated_button.dart';

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

  Widget build(BuildContext context) {
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
                                "Assets/villager1.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              color: Colors.amber,
                              height: AllDimensions.px10,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Image.asset(
                                "Assets/login2.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: AllDimensions.px10,
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Image.asset(
                                "Assets/login3.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: AllDimensions.px10,
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Image.asset(
                                "Assets/login4.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: AllDimensions.px10,
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Image.asset(
                                "Assets/login5.png",
                                fit: BoxFit.cover,
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: AllDimensions.px168,
                        decoration: BoxDecoration(color: AppColors.white,boxShadow: [BoxShadow(color: AppColors.red,blurRadius: AllDimensions.px5,)],borderRadius: BorderRadius.circular(AllDimensions.px10)),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset("Assets/medalclothes.png"),
                                Image.asset("Assets/competition.png")
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: AllDimensions.px80, top: AllDimensions.px20),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset("Assets/coin.png"),
                                      Column(
                                        children: [
                                          Text(AllStrings.yourrank,style: GoogleFonts.poppins(fontSize: AllDimensions.px25,fontWeight: FontWeight.bold),),
                                         Text("278",style: GoogleFonts.poppins(fontSize: AllDimensions.px40, fontWeight: FontWeight.bold, color: AppColors.grey),)
                                        ],
                                      )
                                      
                                    ],
                                  ),
                                  // MaterialButton(onPressed: (){},color: AppColors.red,minWidth: AllDimensions.px114,child: Text(AllStrings.play))
                                  // AnimatedButton(animatedOn: AnimatedOn.onHover,height: AllDimensions.px30,width: AllDimensions.px114,text: AllStrings.play, onPress: (){},selectedTextColor: Colors.black,transitionType: TransitionType.TOP_TO_BOTTOM,textStyle: GoogleFonts.poppins(fontSize: AllDimensions.px20,fontWeight: FontWeight.bold,),backgroundColor: AppColors.red,borderRadius: AllDimensions.px10,animationDuration: Duration(minutes: 5),)
                                  // MaterialButton(,onPressed: (){},child: Text(AllStrings.yourrank),color: AppColors.red,minWidth: AllDimensions.px114)
                                  Container(
                                    width: AllDimensions.px118,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(AllDimensions.px10),color: AppColors.red),
                                    child: Center(
                                      child: Text(
                                        AllStrings.play,
                                        style: GoogleFonts.poppins(
                                            fontSize: AllDimensions.px20,
                                            color: AppColors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: AllDimensions.px10, color: AppColors.red)]),
                        child: Stack(
                          children: [
                            Image.asset("Assets/informaffectivity.png"),
                            Column(
                              children: [
                                Text(AllStrings.informbanner,style: GoogleFonts.poppins(color: AppColors.black,fontSize: AllDimensions.px18,fontWeight: FontWeight.bold),),
                                Container(
                                  
                                  decoration: BoxDecoration(color: AppColors.red),  
                                  child: Text(AllStrings.informaffectivity,),                                  
                                )        
                              ],
                            )
                            
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(blurRadius: AllDimensions.px10)
                                ],
                                borderRadius:
                                    BorderRadius.circular(AllDimensions.px10),
                                color: AppColors.white),
                            padding: EdgeInsets.all(AllDimensions.px50),
                            child: Center(
                                child: Text(
                              AllStrings.addvehicle,
                              style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: AllDimensions.px15,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          SizedBox(
                            width: AllDimensions.px10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(blurRadius: AllDimensions.px10)
                                ],
                                borderRadius:
                                    BorderRadius.circular(AllDimensions.px10),
                                color: AppColors.white),
                            padding: EdgeInsets.all(AllDimensions.px50),
                            child: Center(
                                child: Text(
                              AllStrings.campaigns,
                              style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: AllDimensions.px15,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: AllDimensions.px10)
                              ],
                              borderRadius:
                                  BorderRadius.circular(AllDimensions.px10),
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.all(AllDimensions.px50),
                            child: Center(
                                child: Text(
                              AllStrings.requestBloodCheck,
                              style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: AllDimensions.px15,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
    
                          // SizedBox(
                          //   width: AllDimensions.px10,
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width * 0.5,
                          //   decoration: BoxDecoration(
                          //       borderRadius:
                          //           BorderRadius.circular(AllDimensions.px10),
                          //       color: AppColors.white),
                          //   padding: EdgeInsets.all(AllDimensions.px50),
                          //   child: Center(
                          //       child: Text(
                          //     AllStrings.addvehicle,
                          //     style: TextStyle(
                          //         color: AppColors.red,
                          //         fontSize: AllDimensions.px15,
                          //         fontWeight: FontWeight.bold),
                          //   )),
                          // )
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
