// import 'package:client/providers/otp_provider.dart';

import '../../const/all_imports.dart';

class ResetPassword extends StatelessWidget {
  static String get routeName => "/reset";
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "Assets/reset.png",
                  width: MediaQuery.of(context).size.width,
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
                InkWell(
                    onTap: () {
                      // provider.validateReset();
                      // provider.sendotp();
                      provider.validateReset(context);
                    },
                    child: CustomButton(
                        bordercolor: Colors.black,
                        borderradius: AllDimensions.px10,
                        boxcolor: AppColors.green,
                        borderwidth: 3,
                        fontcolor: AppColors.white,
                        fontsize: AllDimensions.px20,
                        text: AllStrings.resetPassword))
              ],
            ),
          ),
        ),
      );
    });
  }
}
