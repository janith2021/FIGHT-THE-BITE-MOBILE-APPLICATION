import '../../const/all_imports.dart';

class NotificationPage extends StatelessWidget {
  static String get routename => "villager/notification";
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.amber,
        title: Text(AllStrings.notificationtitle,style: GoogleFonts.poppins(color: AppColors.lightred,fontWeight: FontWeight.bold),),
        leading: BackButton(color: AppColors.lightred),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(AllDimensions.px10),
        child: Column(
          children: [
            SizedBox(
              height: AllDimensions.px20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: AllDimensions.px300,
              decoration: BoxDecoration(color: AppColors.white,boxShadow: [BoxShadow(color: AppColors.black,blurRadius: AllDimensions.px10)],borderRadius: BorderRadius.circular(AllDimensions.px20)),
              child: Column( 
                children: [
                  Container(
                    
                    padding: EdgeInsets.all(AllDimensions.px10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: AppColors.lightred),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Doctor Chanelling",style: TextStyle(color: AppColors.white,fontSize: AllDimensions.px18),),
                        Text("10:47 AM",style: TextStyle(color: AppColors.white,fontSize: AllDimensions.px18),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AllDimensions.px10),
                    child: Expanded(child: Text(AllStrings.meetingdetails,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),)),
                  ),
                  SizedBox(height: AllDimensions.px20,),
                  // Text(AllStrings.meetingdetails),
                  // Uri(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
