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
            Image.asset(
              'Assets/otp.jpg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AllStrings.otpsent,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 200, 7, 26),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizeBox().sizedBox10,
                  PinCodeTextField(
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
                        shape: PinCodeFieldShape.box,
                        fieldHeight: AllDimensions.px50,
                        fieldWidth: AllDimensions.px50,
                        borderWidth: AllDimensions.px50),
                  ),
                  SizeBox().sizedBox10,
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
