// import 'package:flutter/foundation.dart';

// import 'package:art_sweetalert/art_sweetalert.dart';

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
    return Consumer<SignupProvider>(builder: (context, provider, _) {
      if (provider.snackbarmessage.isNotEmpty) {}
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
                    label: AllStrings.addimage,
                    errorText: provider.nameError,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.controlleremail,
                    hintText: AllStrings.emailHint,
                    iconData: Icons.email,
                    label: AllStrings.email,
                    errorText: provider.emailError,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.controllermobile,
                    hintText: AllStrings.mobileHint,
                    iconData: Icons.call,
                    label: AllStrings.mobile,
                    errorText: provider.mobileError,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                      controller: provider.controllerpassword,
                      obscureText: provider.obscureText,
                      hintText: AllStrings.passwordHint,
                      iconData: Icons.password,
                      label: AllStrings.password,
                      errorText: provider.passwordError,
                      suffixIcon: IconButton(
                        onPressed: () {
                          provider.updateobscureText();
                        },
                        icon: Icon(provider.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.controllerconfirmpassword,
                    obscureText: provider.obscureText,
                    hintText: AllStrings.confirmpasswordHint,
                    iconData: Icons.password,
                    label: AllStrings.confirmpassword,
                    errorText: provider.confirmpasswordError,
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.updateobscureText();
                      },
                      icon: const Icon(null),
                    ),
                  ),
                  SizeBox().sizedBox10,
                  InkWell(
                    onTap: () {
                      if (provider.validateSignUp(context)) {
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
                        text: AllStrings.register,shadow: AllDimensions.px10),
                  ),
                  SizeBox().sizedBox10,
                  InkWell(
                    onTap: () {
                      // Navigator.pushReplacementNamed(context, "/login");
                      // if (provider.validateSignUp(context)) {
                      Navigator.pushReplacementNamed(context, "/login");
                      // }
                    },
                    child: RichText(
                      text: TextSpan(
                          text: AllStrings.haveanaccount,
                          style: TextStyle(
                              color: AppColors.purple,
                              fontSize: AllDimensions.px20),
                          children: [
                            TextSpan(
                                text: AllStrings.login,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: AllDimensions.px20))
                          ]),
                    ),
                  ),
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
