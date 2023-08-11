import 'package:client/providers/change_password_provider.dart';
import 'package:client/providers/otp_provider.dart';
import 'package:client/screen/Organization/organization_dashboard.dart';
import 'package:client/screen/authentication/otp_screen.dart';
import 'package:client/screen/authentication/password_change.dart';
import 'package:client/screen/organization/addCampaign.dart';
import 'package:client/screen/organization/createCampaign.dart';
import 'package:client/screen/organization/Ongoing.dart';
// import 'package:client/screen/officer/Grama_Niladhari/grama_niladhari_dashboard.dart';
// import 'package:client/screen/officer/PHI/phi_dashboard.dart';
// import 'package:client/screen/user/user_dashboard.dart';
import 'package:client/widget/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/presentation.dart';

import 'const/all_imports.dart';

Future main() async {
  // await dotenv.load(fileName: ".env");
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => ResetPasswordProvider()),
        ChangeNotifierProvider(create: (_) => OtpProvider()),
        ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: Snackbar.scaffoldMessengerKey,
          // initialRoute: Splash.routename,
          // initialRoute: OtpScreen.routename,
          routes: {
            Splash.routename: (_) => const Splash(),
            Login.routeName: (_) => const Login(),
            SignUp.routename: (_) => const SignUp(),
            ResetPassword.routeName: (_) => const ResetPassword(),
            OtpScreen.routename: (_) => const OtpScreen(),
            ChangePassword.routename: (_) => const ChangePassword(),
            UserDashboard.routename: (_) => const UserDashboard(),
            GramaNiladhariDashBoard.routename: (_) =>
                const GramaNiladhariDashBoard(),
            PHIDashBoard.routename: (_) => const PHIDashBoard(),
            OrganizationDashboard.routename: (_) =>
                const OrganizationDashboard(),
            CreateCampaign.routename: (_) => const CreateCampaign(),
            MyForm.routename: (_) => MyForm(),
            CardWithButtonsPage.routename: (_) => CardWithButtonsPage(),
          },
          home: SplashView(
            gradient:
                LinearGradient(colors: [AppColors.yellow, AppColors.orange]),
            loadingIndicator: CircularProgressIndicator(
                backgroundColor: AppColors.red, color: AppColors.green),
            logo: Image.asset("Assets/splash_screen/logo.png"),
            done: Done(const Login()),
          )),
    );
  }
}
