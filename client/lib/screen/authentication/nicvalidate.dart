import 'package:client/providers/nic_validation_provider.dart';
// import 'package:constrained_scroll_view/constrained_scroll_view.dart';
// import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

import '../../const/all_imports.dart';

class NICValidate extends StatelessWidget {
  static String get routename => '/nic/validate';
  const NICValidate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NICValidateProvider>(builder: (context, provider, _) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(AllDimensions.px20),
          child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("Assets/Nic_Validate/image.png"),
                Image.asset("Assets/Nic_Validate/image logo.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AllStrings.nicvalidate,
                    style: GoogleFonts.poppins(
                        fontSize: AllDimensions.px18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: AllDimensions.px20,
                ),
                CustomTextField(
                    controller: provider.controllernic,
                    hintText: "Enter NIC Number",
                    iconData: Icons.person,
                    label: "NIC Number",
                    errorText: "errorText"),
                SizedBox(
                  height: AllDimensions.px20,
                ),
                CustomButton(
                    bordercolor: AppColors.lightred,
                    borderradius: AllDimensions.px100,
                    boxcolor: AppColors.lightred,
                    borderwidth: AllDimensions.px10,
                    text: "Next",
                    styles: GoogleFonts.poppins(color: AppColors.white),
                    btnWidth: MediaQuery.of(context).size.width * 0.8),
                SizedBox(
                  height: AllDimensions.px20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "If You are a Guest Villager Click Below Button to Register",
                    style: GoogleFonts.poppins(
                        fontSize: AllDimensions.px15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: AllDimensions.px20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/guest/register");
                    },
                    child: CustomButton(
                        bordercolor: AppColors.lightred,
                        borderradius: AllDimensions.px20,
                        boxcolor: AppColors.lightred,
                        borderwidth: AllDimensions.px10,
                        text: "Guest Registration",
                        styles: GoogleFonts.poppins(color: AppColors.white),
                        btnWidth: MediaQuery.of(context).size.width * 0.8))
              ],
            ),
          ),
        ),
      );
    });
  }
}
