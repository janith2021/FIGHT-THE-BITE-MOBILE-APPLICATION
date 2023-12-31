import 'package:client/providers/change_password_provider.dart';
import 'package:client/providers/create_campaign_provider.dart';
import 'package:client/providers/guestregistration.dart';
import 'package:client/providers/laboratorybooking_provider.dart';
import 'package:client/providers/nic_validation_provider.dart';
import 'package:client/providers/otp_provider.dart';
import 'package:client/providers/symptomsinform.dart';
import 'package:client/providers/view_campaign_provider.dart';
import 'package:client/providers/villagerregistration.dart';
import 'package:client/screen/Organization/organization_dashboard.dart';
import 'package:client/screen/authentication/guestsignup.dart';
// import 'package:client/screen/authentication/guestvillager.dart';
import 'package:client/screen/authentication/nicvalidate.dart';
import 'package:client/screen/authentication/otp_screen.dart';
import 'package:client/screen/authentication/password_change.dart';
import 'package:client/screen/officer/PHI/already_affected_patients.dart';
import 'package:client/screen/authentication/villagerRegistration.dart';
import 'package:client/screen/officer/Nurse/form.dart';
import 'package:client/screen/officer/PHI/newly_affected_patients.dart';
import 'package:client/screen/organization/CreateCampaignForm.dart';
import 'package:client/screen/organization/Ongoing.dart';
import 'package:client/screen/organization/addCampaign.dart';
import 'package:client/screen/officer/PHI/notification.dart';
import 'package:client/screen/organization/CreateCampaignForm.dart';
import 'package:client/screen/organization/createCampaign%20backup.dart';
import 'package:client/screen/organization/viewCampaignHistory.dart';
import 'package:client/screen/organization/viewOngoingCampaign.dart';
import 'package:client/screen/user/affected1.dart';
import 'package:client/screen/user/affected2.dart';
import 'package:client/screen/user/affectivity.dart';
import 'package:client/screen/user/laboratoryReport.dart';
import 'package:client/screen/user/laboratorybooking.dart';
import 'package:client/screen/user/leaderboard.dart';
import 'package:client/screen/user/notification.dart';
import 'package:client/screen/user/profile.dart';
import 'package:client/screen/user/viewCampaignHistory.dart';
// import 'package:client/screen/officer/Grama_Niladhari/grama_niladhari_dashboard.dart';
// import 'package:client/screen/officer/PHI/phi_dashboard.dart';
// import 'package:client/screen/user/user_dashboard.dart';
import 'package:client/widget/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/presentation.dart';

import 'const/all_imports.dart';
import 'screen/officer/PHI/judgments.dart';
import 'screen/officer/PHI/newly_affected_patients.dart';

Future main() async {
  // await dotenv.load(fileName: ".env")
  // Hive.init();
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
          ChangeNotifierProvider(create: (_) => LaboratoryBookingProvider()),
          ChangeNotifierProvider(create: (_) => CreateCampaignProvider()),
          ChangeNotifierProvider(create: (_) => ViewCampaignProvider()),
          ChangeNotifierProvider(create: (_) => NICValidateProvider()),
          ChangeNotifierProvider(create: (_) => GusetRegistrationProvider()),
          ChangeNotifierProvider(create: (_)=> VillagerRegistrationProvider()),
          ChangeNotifierProvider(create: (_)=> SymptomsinformProvider()),
          // ChangeNotifierProvider(create: (_) => )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: Snackbar.scaffoldMessengerKey,
            // initialRoute: Splash.routename,
            // initialRoute: OtpScreen.routename,
            routes: {
              NewlyAffectedPatients.routename: (_) => NewlyAffectedPatients(),
              Splash.routename: (_) => const Splash(),
              Login.routeName: (_) => const Login(),
              GuestSignUp.routename: (_) => const GuestSignUp(),
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
              // CreateCampaign.routename : (_) => CreateCampaign()
              Laboratory.routename: (_) => const Laboratory(),
              LaboratoryBooking.routename: (_) => const LaboratoryBooking(),
              NotificationPage.routename: (_) => const NotificationPage(),
              Affectivity.routename: (_) => const Affectivity(),
              LeaderBoard.routename: (_) => const LeaderBoard(),
              // MyForm.routename: (_) => MyForm(),
              SelectionScreen.routename: (_) => const SelectionScreen(),
              SymptomCheckScreen.routename: (_) => SymptomCheckScreen(),
              ViewOngoingCampign.routname: (_) => const ViewOngoingCampign(),
              ViewCampaignHistory.routename: (_) => const ViewCampaignHistory(),
              UserCampaign.routename: (_) =>  UserCampaign(),
              NICValidate.routename: (_) => const NICValidate(),
              GuestRegister.routename: (_) => const GuestRegister(),
              Profile.routename: (_) => Profile(),
              NurseCheck.routename: (_) => NurseCheck(),
              PhiNotification.routeName: (_) => const PhiNotification(),
              Judgments.routename: (_) => const Judgments(),
              NewlyAffectedPatients.routename: (_) => NewlyAffectedPatients(),
              AlreayAffectedPatient.routename: (_) => AlreayAffectedPatient(),
              // CreateCampaignForm.routename : (_) => CreateCampaignForm(),
              MyForms.routename: (_) => MyForms(),
              VillagerRegister.routename: (_) =>  VillagerRegister(),
              LeaderBoard.routename: (_) => const LeaderBoard(),

              // CreateCampaign.routename : (_) =>
              // GuestVillagerForm.routename : (_) => const GuestVillagerForm(),
              // SelectionScreen.routename: (_) => const SelectionScreen(),
              // AffectPerson.routename : (_) => AffectPerson(),
            },
            home: SplashView(
              gradient:
                  LinearGradient(colors: [AppColors.yellow, AppColors.orange]),
              loadingIndicator: CircularProgressIndicator(
                  backgroundColor: AppColors.red, color: AppColors.green),
              logo: Image.asset("Assets/splash_screen/logo.png"),
              done: Done(const Login()),
            )));
  }
}
