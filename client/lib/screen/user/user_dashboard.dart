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
    return Scaffold(
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
                    child: ListTile(
                      title: Image.asset("Assets/competition.png",width: 158,height: 144,),
                      tileColor: AppColors.white,
                      // shape: Border.all(width: AllDimensions.px5, style: BorderStyle.solid),
                      trailing: Text(_currentuser.toString()),
                      contentPadding: EdgeInsets.all(AllDimensions.px10),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AllDimensions.px10),
                          side: BorderSide(color: AppColors.white)),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ListTile(
                  //     title: Text('Hello'),
                  //     tileColor: AppColors.white,
                  //     leading: Text('HI'),
                  //     // shape: Border.all(width: AllDimensions.px5, style: BorderStyle.solid),
                  //     trailing: Text(_currentuser.toString()),
                  //     contentPadding: EdgeInsets.all(AllDimensions.px40),
                  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AllDimensions.px10),side: BorderSide(color: AppColors.white)),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ListTile(
                  //     title: Text('Hello'),
                  //     tileColor: AppColors.white,
                  //     leading: Text('HI'),
                  //     // shape: Border.all(width: AllDimensions.px5, style: BorderStyle.solid),
                  //     trailing: Text(_currentuser.toString()),
                  //     contentPadding: EdgeInsets.all(AllDimensions.px40),
                  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AllDimensions.px10),side: BorderSide(color: AppColors.white)),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ListTile(
                  //     title: Text('Hello'),
                  //     tileColor: AppColors.white,
                  //     leading: Text('HI'),
                  //     // shape: Border.all(width: AllDimensions.px5, style: BorderStyle.solid),
                  //     trailing: Text(_currentuser.toString()),
                  //     contentPadding: EdgeInsets.all(AllDimensions.px40),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(AllDimensions.px10),
                  //         side: BorderSide(color: AppColors.white)),
                  //   ),
                  // ),
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
        ));
  }
}
