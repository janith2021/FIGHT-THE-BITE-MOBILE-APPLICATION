import 'package:client/providers/otp_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../const/all_imports.dart';

class OtpScreen extends StatefulWidget {
  static String get routename => "/otp";
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OtpProvider>(builder: (context, provider, _) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.network(
              'https://img.freepik.com/free-photo/3d-render-secure-login-password-illustration_107791-16640.jpg?w=740&t=st=1691757993~exp=1691758593~hmac=4f6d8a0bddaecf2534dadfeb8aa83685ffdee3b7d4c5a1a140cd9a7ce3acc780',
              // height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(AllDimensions.px15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AllDimensions.px200,
                  ),
                  Text(
                    AllStrings.otpsent,
                    style: TextStyle(
                      color: AppColors.lightred,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizeBox().sizedBox20,
                  PinCodeTextField(
                    onCompleted: (value) => {provider.otpvalidate(context)},
                    onChanged: (value) => {provider.Otp = value},
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: AllDimensions.px20,
                      fontWeight: FontWeight.bold,
                    ),
                    pinTheme: PinTheme(
                        // selectedColor: AppColors.red,
                        shape: PinCodeFieldShape.box,
                        fieldHeight: AllDimensions.px50,
                        fieldWidth: AllDimensions.px50,
                        borderWidth: AllDimensions.px50),
                  ),
                  SizeBox().sizedBox20,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AllDimensions.px10),
                        color: AppColors.red),
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {
                          provider.otpvalidate(context);
                          
                        },
                        child: Text(
                          AllStrings.verifyotp,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: AllDimensions.px30),
                        )),
                  )

                  // Text(
                  //   AllStrings.otpsent,
                  //   style:
                  //       const TextStyle(color: Colors.white, fontSize: 15),
                  // ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
