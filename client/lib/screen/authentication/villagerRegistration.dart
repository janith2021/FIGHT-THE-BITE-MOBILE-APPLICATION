import 'package:client/providers/villagerregistration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/all_imports.dart';

class VillagerRegister extends StatelessWidget {
  List villager = [];

  static String get routename => "/nicvalidate/register";
  VillagerRegister({super.key});

  Future getVillagerDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.getString('gsdivision');
    // prefs.getString('divisionnumber');

    debugPrint(prefs.getString('divisionnumber'));
    villager.addAll([
      prefs.getString('gsdivision'),
      prefs.getString('divisionnumber'),
      prefs.getString('address'),
      prefs.getString('houseHoldno'),
      prefs.getString('nic'),
      prefs.getString('name')
    ]);
    // villager.add(prefs.getString('gsdivision'));
    debugPrint(villager.toString());
    return villager;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VillagerRegistrationProvider>(
        builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Image.network(
                    "https://img.freepik.com/free-photo/bank-card-mobile-phone-online-payment_107791-16646.jpg?w=740&t=st=1698222347~exp=1698222947~hmac=8230de0b9f0407ffa297af3087041ad1a081b771d2ee0f366fb6f32a38e7d206",
                    width: MediaQuery.of(context).size.width,
                    height: AllDimensions.px200,
                  ),
                  FutureBuilder(
                      future: getVillagerDetails(),
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(
                            color: AppColors.red,
                          );
                        } else {
                          if (snapshot.hasError) {
                            return Expanded(
                                child: Text(snapshot.error.toString()));
                          }
                          var list = snapshot.data;
                          // debugPrint(list);
                          return Padding(
                            padding: EdgeInsets.all(AllDimensions.px10),
                            child: Container(
                              padding: EdgeInsets.all(AllDimensions.px20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.black,
                                      width: AllDimensions.px5),
                                  borderRadius: BorderRadius.circular(
                                      AllDimensions.px10)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.2),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "GS Division:  ",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            list[0],
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.cyan,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Division Number:  ",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          list[1],
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.cyan,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Address: ",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          list[2],
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.cyan,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "House Hold No: ",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          list[3],
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.cyan),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "NIC: ",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          list[4],
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.cyan),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Name:  ",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          list[5],
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.cyan),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        // return const Column(
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Text("GS Division: "),
                        //         Text(""),
                        //       ],
                        //     ),
                        //   ],
                        // );
                      }),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AllDimensions.px10),
                    child: CustomTextField(
                        controller: provider.controlleremail,
                        hintText: "E-mail",
                        iconData: Icons.email,
                        label: "E-mail",
                        errorText: provider.emailerror),
                  ),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AllDimensions.px10),
                    child: CustomTextField(
                      controller: provider.controllerpassword,
                      hintText: "Password",
                      iconData: Icons.password,
                      label: "Password",
                      errorText: provider.passworderror,
                      obscureText: provider.obscuretext,
                      suffixIcon: IconButton(
                        onPressed: () {
                          provider.updateobscuretext();
                        },
                        icon: provider.obscuretext
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AllDimensions.px10),
                    child: CustomTextField(
                      controller: provider.controllerconfirmpassword,
                      hintText: "Confirm Password",
                      iconData: Icons.password,
                      label: "Confirm Password",
                      errorText: provider.confirmpassworderror,
                      obscureText: provider.obscuretext,
                    ),
                  ),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AllDimensions.px10),
                    child: GestureDetector(
                      onTap: () {
                        provider.VillagerRegister(context);
                      },
                      child: CustomButton(
                          bordercolor: Colors.red,
                          borderradius: AllDimensions.px10,
                          boxcolor: Colors.red,
                          borderwidth: AllDimensions.px10,
                          text: "Register",
                          styles: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: AllDimensions.px18),
                          btnWidth: MediaQuery.of(context).size.width * 0.8),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
