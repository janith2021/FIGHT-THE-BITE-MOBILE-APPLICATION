import 'package:client/providers/change_password_provider.dart';

import '../../const/all_imports.dart';

class ChangePassword extends StatelessWidget {
  static String get routename => '/change';
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordProvider>(builder: (context, provider, _) {
      return Scaffold(
        // backgroundColor: Colors.amber,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          // Image.asset(
          //   'Assets/change.jpg',
          //   height: MediaQuery.of(context).size.width,
          //   width: MediaQuery.of(context).size.width,
          //   fit: BoxFit.cover,
          // ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(AllDimensions.px20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("Assets/Reset_Password/changepassword.png",height: AllDimensions.px200,),
                  SizedBox(height: AllDimensions.px50,),
                  Text(
                    AllStrings.enternewpassword,
                    style: TextStyle(color: AppColors.black, fontSize: AllDimensions.px20),
                  ),
                  SizeBox().sizedBox10,
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
                  SizeBox().sizedBox20,
                  InkWell(
                      onTap: () {
                        provider.validatechangepassword(context);
                      },
                      child: CustomButton(
                          bordercolor: AppColors.lightred,
                          borderradius: 40,
                          boxcolor: AppColors.lightred,
                          borderwidth: 3,
                          btnWidth: MediaQuery.of(context).size.width * 0.9,
                          styles: GoogleFonts.aldrich(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: AllDimensions.px20,),
                          text: AllStrings.resetPassword,btnheight: AllDimensions.px39,)
                          )
                ],
              ),
            ),
          )
        ]),
      );
    });
  }
}
