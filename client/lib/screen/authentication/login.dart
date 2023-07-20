import '../../const/all_imports.dart';

class Login extends StatelessWidget {
  static String get routeName => "/login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: AllDimensions.px10),
              child: Column(
                children: [
                  CustomCarousel(autoplay: true, durationInSeconds: 1, items: [
                    Image.asset(
                      "Assets/login1.png",
                    ),
                    Image.asset(
                      "Assets/login2.png",
                    ),
                    Image.asset(
                      "Assets/login3.png",
                    ),
                    Image.asset(
                      "Assets/login4.png",
                    ),
                    Image.asset(
                      "Assets/login5.png",
                    )
                  ]),
                  CustomTextField(
                    controller: provider.emailController,
                    hintText: AllStrings.emailHint,
                    iconData: Icons.email,
                    label: AllStrings.email,
                    errorText: provider.emailError,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.passwordController,
                    hintText: AllStrings.passwordHint,
                    obscureText: provider.obscureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.updateobscureText();
                      },
                      icon: Icon(provider.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    iconData: Icons.password,
                    label: AllStrings.password,
                    errorText: provider.passwordError,
                  ),
                  SizeBox().sizedBox10,
                  InkWell(
                    onTap: () async{
                      await provider.formvalidation(context);
                    },
                    child: CustomButton(
                        bordercolor: Colors.black,
                        borderradius: AllDimensions.px30,
                        boxcolor: AppColors.red,
                        borderwidth: 3,
                        btnWidth: MediaQuery.of(context).size.width*0.9,
                        btnheight: AllDimensions.px50,
                        styles: GoogleFonts.aldrich(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: AllDimensions.px30,),
                        text: AllStrings.login),
                  ),
                  SizeBox().sizedBox10,
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: RichText(
                      text: TextSpan(
                          text: AllStrings.dontHaveAccount,
                          style: TextStyle(
                              color: AppColors.purple,
                              fontSize: AllDimensions.px20),
                          children: [
                            TextSpan(
                                text: AllStrings.signUp,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: AllDimensions.px20))
                          ]),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/reset");
                      },
                      child: Text(
                        AllStrings.resetPassword,
                        style: TextStyle(
                            fontSize: AllDimensions.px20, color: AppColors.red),
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
