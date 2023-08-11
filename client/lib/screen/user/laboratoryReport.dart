import '../../const/all_imports.dart';

class Laboratory extends StatelessWidget {
  static String get routename => "/villager/laboratory";
  const Laboratory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AllDimensions.px20),
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              width: MediaQuery.of(context).size.width, 
              // alignment: Alignment(10, 10),
              child:
                  Stack(children: [
                  ClipRRect(borderRadius: BorderRadius.circular(AllDimensions.px10),
                    child: Image.network(
                      "https://www.imlab.com.ph/assets/img/book2.png",
                      // height: AllDimensions.px100,
                    )),
                  Column(
                    children:  [
                      Padding(
                        padding: EdgeInsets.all(AllDimensions.px20),
                        child: Text("If You Want to get appoinment for a Lab Test",style: GoogleFonts.poppins(fontSize: AllDimensions.px20,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AllDimensions.px50,left: MediaQuery.of(context).size.width * 0.2),
                        child: Row(mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [CustomButton(bordercolor: AppColors.red, borderradius: AllDimensions.px10, boxcolor: AppColors.red, borderwidth: AllDimensions.px10, text: "Appoinment", styles: GoogleFonts.poppins(fontSize: AllDimensions.px20,fontWeight: FontWeight.bold), btnWidth: AllDimensions.px200)]),
                      )
                    ],
                  )]),
            ),
            
          ],
        ),
      ),
    );
  }
}
