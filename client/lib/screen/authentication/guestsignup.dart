// import 'package:flutter/foundation.dart';

// import 'package:art_sweetalert/art_sweetalert.dart';

import 'package:client/providers/guestregistration.dart';

import '../../const/all_imports.dart';

class GuestSignUp extends StatefulWidget {
  static String get routename => "/guest/register";
  const GuestSignUp({super.key});

  @override
  State<GuestSignUp> createState() => _GuestSignUpState();
}

class _GuestSignUpState extends State<GuestSignUp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GusetRegistrationProvider>(builder: (context, provider, _) {
      // if (provider.snackbarmessage.isNotEmpty) {}
      return Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: AllDimensions.px10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ImagePickerWidget(getimage: provider.getProfile),
                  SizeBox().sizedBox5,
                  CustomTextField(
                    controller: provider.controllername,
                    hintText: AllStrings.nameHint,
                    iconData: Icons.person_3_rounded,
                    label: AllStrings.name,
                    errorText: provider.nameerror,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.controllernic,
                    hintText: "NIC Number",
                    iconData: Icons.person_3_rounded,
                    label: "NIC Number",
                    errorText: provider.nicerror,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.controlleremail,
                    hintText: AllStrings.emailHint,
                    iconData: Icons.email,
                    label: AllStrings.email,
                    errorText: provider.emailerror,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.controllercontact,
                    hintText: AllStrings.mobileHint,
                    iconData: Icons.call,
                    label: AllStrings.mobile,
                    errorText: provider.contacterror,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                      controller: provider.controlleroldgsdivision,
                      hintText: "Old Division Name",
                      iconData: Icons.other_houses,
                      label: "Old Division Name",
                      errorText: provider.olddivisionnumbererror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controlleroldaddress,
                      hintText: "Old Address",
                      iconData: Icons.home,
                      label: "Old Address",
                      errorText: provider.oldaddresserror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controlleroldgsdivisionnumber,
                      hintText: "Old Division Number",
                      iconData: Icons.nine_mp_outlined,
                      label: "Old Division Number",
                      errorText: provider.olddivisionnumbererror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllernewgsdivision,
                      hintText: "New Division Name",
                      iconData: Icons.other_houses,
                      label: "New Division Name",
                      errorText: provider.newgsdivisionerror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllernewaddress,
                      hintText: "New Address",
                      iconData: Icons.home,
                      label: "New Address",
                      errorText: provider.newaddresserror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllernewdivisionnumber,
                      hintText: "New Division Number",
                      iconData: Icons.nine_mp_outlined,
                      label: "New Division Number",
                      errorText: provider.newdivisionnumbererror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllerpassword,
                      obscureText: provider.obscuretext,
                      hintText: AllStrings.passwordHint,
                      iconData: Icons.password,
                      label: AllStrings.password,
                      errorText: provider.passworderror,
                      suffixIcon: IconButton(
                        onPressed: () {
                          provider.updateobscuretext();
                        },
                        icon: Icon(provider.obscuretext
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.controllerconfirmpassword,
                    obscureText: provider.obscuretext,
                    hintText: AllStrings.confirmpasswordHint,
                    iconData: Icons.password,
                    label: AllStrings.confirmpassword,
                    errorText: provider.confirmpassworderror,
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.updateobscuretext();
                      },
                      icon: const Icon(null),
                    ),
                  ),
                  SizeBox().sizedBox10,
                  InkWell(
                    onTap: () {
                      // if (provider.validateSignUp(context)) {
                      //   Navigator.pushNamed(context, "/login");
                      // }
                      if (provider.guestSignUpValidation()) {
                        Navigator.pushNamed(context, "/login");
                      }
                    },
                    child: CustomButton(
                        bordercolor: AppColors.lightred,
                        borderradius: AllDimensions.px50,
                        boxcolor: AppColors.lightred,
                        borderwidth: 3,
                        btnWidth: MediaQuery.of(context).size.width * 0.9,
                        btnheight: AllDimensions.px39,
                        styles: GoogleFonts.lato(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AllDimensions.px20,
                        ),
                        text: AllStrings.register,
                        shadow: AllDimensions.px10),
                  ),
                  SizedBox(
                    height: AllDimensions.px40,
                  ),
                  // CustomTextField(controller: provider.controllerconfirmpassword, hintText: "", iconData: Icons.abc, label: "", errorText: ""),
                  // SizeBox().sizedBox10,
                  // CustomTextField(controller: provider.controllerpassword, hintText: "hintText", iconData: Icons.abc, label: "label", errorText: "errorText")
                  //  if (provider.snackbarmessage.isNotEmpty)
                  // Snackbar.successSnackBar(provider.snackbarmessage).show(context)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
