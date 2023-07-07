import 'package:client/providers/change_password_provider.dart';

import '../../const/all_imports.dart';

class ChangePassword extends StatelessWidget {
  static String get routename => '/change';
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.amber,
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Please Enter Your New Password in the Given Field',
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
                  SizeBox().sizedBox10,
                  InkWell(
                      onTap: () {
                        provider.validatechangepassword(context);
                      },
                      child: CustomButton(
                          bordercolor: Colors.black,
                          borderradius: 40,
                          boxcolor: Colors.red,
                          borderwidth: 3,
                          fontcolor: Colors.white,
                          fontsize: AllDimensions.px20,
                          text: 'Reset'))
                ],
              ),
            ),
          )
        ]),
      );
    });
  }
}
