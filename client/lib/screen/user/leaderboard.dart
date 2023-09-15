// import 'package:profile_photo/profile_photo.dart';

import 'package:profile_photo/profile_photo.dart';

import '../../const/all_imports.dart';

class LeaderBoard extends StatelessWidget {
  static String get routename => "villager/leaderboard";
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightred,
        toolbarHeight: AllDimensions.px50,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: AllDimensions.px10,
            bottom: AllDimensions.px10,
            left: AllDimensions.px20,
            right: AllDimensions.px20),
        child: Column(
          children: [
            Container(
              color: AppColors.cream,
              height: height * 0.78,
            ),
            SizedBox(
              height: AllDimensions.px15,
            ),
            Container(
              // color: AppColors.darkred,
              height: height * 0.1,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(AllDimensions.px10)),
                color: const Color.fromARGB(255, 230, 224, 224),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 137, 133, 133),
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.032, left: width * 0.05),
                    child: Text(
                      "Uploard the Image",
                      style: GoogleFonts.poppins(
                          fontSize: AllDimensions.px20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.02, left: width * 0.6),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.lightred),
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size(100, 50),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), 
                            ),
                          ),
                        ),
                        child: Text(
                          "Uploard",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
