// import 'package:client/providers/otp_provider.dart';

import '../../const/all_imports.dart';

class ResetPassword extends StatelessWidget {
  static String get routeName => "/reset";
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordProvider>(builder: (context, provider, _) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(AllDimensions.px10),
                  child: Image.network(
                    "https://img.freepik.com/free-vector/sign-concept-illustration_114360-125.jpg?w=740&t=st=1691744012~exp=1691744612~hmac=8449c0874e71ff519b7627dfe972cd8d034509135782d3e73cd3dd97659adff2",
                    width: MediaQuery.of(context).size.width,
                    height: AllDimensions.px280,
                    // scale: 0.2,
                  ),
                ),
                SizeBox().sizedBox20,
                Padding(
                  padding: EdgeInsets.all(AllDimensions.px20),
                  child: CustomTextField(
                    controller: provider.controlleremail,
                    hintText: AllStrings.emailHint,
                    iconData: Icons.email,
                    label: AllStrings.email,
                    errorText: provider.emailError,
                  ),
                ),
                SizeBox().sizedBox20,
                InkWell(
                    onTap: () {
                      // provider.validateReset();
                      // provider.sendotp();
                      provider.validateReset(context);
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
                        text: AllStrings.emailverify,shadow: AllDimensions.px10),
                    ),
                SizedBox(
                  height: AllDimensions.px20,
                ),    
                Container(
                  height: AllDimensions.px200,
                  child: Image.network("https://img.freepik.com/free-vector/no-mosquito-sign-white_1308-70728.jpg?w=740&t=st=1691744134~exp=1691744734~hmac=525e936ed6b9538af0560f7dd995c8c34c2141a329ce5a58e19b7fff2270e1c4",),
                  
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
