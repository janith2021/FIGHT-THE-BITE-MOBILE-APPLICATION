// import 'package:client/providers/guestregistration.dart';

// import '../../const/all_imports.dart';

// class GuestVillagerForm extends StatelessWidget {
//   static String get routename => "/register/guest";
//   const GuestVillagerForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<GusetRegistrationProvider>(
//       builder: (context,provider,_) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text("Guest Villager Registration",style: GoogleFonts.poppins(color: AppColors.white,fontWeight: FontWeight.bold,),),
//             backgroundColor: AppColors.lightred,
//             centerTitle: true,
//           ),
//           body: Column(
//             children: [ 
//               SizedBox(height: AllDimensions.px20,),
//               CustomTextField(controller: provider.controlleremail, hintText: "Enter Your Email", iconData: Icons.email, label: "", errorText: "")
//             ],
//           ),
//         );
//       }
//     );
//   }
// }
