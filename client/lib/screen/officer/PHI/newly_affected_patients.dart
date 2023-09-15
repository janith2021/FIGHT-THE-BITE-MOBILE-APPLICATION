import '../../../const/all_imports.dart';

class NewlyAffectedPatients extends StatelessWidget {
  static String get routename => "/phi/newlyaffectedpatients";
  const NewlyAffectedPatients({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightred,
          title: Text("Newly Affected Patients",
          style: GoogleFonts.poppins(),),
        ),
        body: Container(
          
        ),
      ));
  }
}