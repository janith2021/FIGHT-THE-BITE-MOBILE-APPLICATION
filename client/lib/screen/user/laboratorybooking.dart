import 'package:client/providers/laboratorybooking_provider.dart';

import '../../const/all_imports.dart';

class LaboratoryBooking extends StatelessWidget {
  static String get routename => "villager/laboratory/appoinment";
  const LaboratoryBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LaboratoryBookingProvider>(
      builder: (context,provider,_) {
        return Scaffold(
          backgroundColor: AppColors.lightgrey,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.lightred,
                child: Padding(
                  padding: EdgeInsets.only(left : AllDimensions.px100 , right: AllDimensions.px100 , top: AllDimensions.px50),
                  child: Text(AllStrings.appointmentdetails,style: GoogleFonts.lato(color: AppColors.white,fontSize: AllDimensions.px20,fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AllDimensions.px118),
                child: Container(
                  padding: EdgeInsets.only(top : AllDimensions.px50),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(AllDimensions.px20)),
                  child: Column(
                    children: [
                      CustomTextField(controller: provider.laboratorynamecontroller, hintText: AllStrings.fullname, iconData: Icons.person, label: AllStrings.fullname, errorText: ""),
                      SizedBox(
                        height: AllDimensions.px10,
                      ),
                      CustomTextField(controller: provider.appointmentdatecontroller, hintText: AllStrings.appointmentdate, iconData: Icons.date_range, label: AllStrings.appointmentdate, errorText: ""),
                      SizedBox(
                        height: AllDimensions.px10,
                      ),
                      CustomTextField(controller: provider.appointmnettimecontroller, hintText: AllStrings.appointmenttime, iconData: Icons.watch_later_outlined, label: AllStrings.appointmenttime, errorText: ""),
                      SizedBox(
                        height: AllDimensions.px10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(AllDimensions.px10),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(AllDimensions.px20),border: Border.all(color: AppColors.black)),
                          child: Padding(
                            padding: EdgeInsets.all(AllDimensions.px20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [     
                                    Text(AllStrings.testmethod,style: GoogleFonts.poppins(fontSize: AllDimensions.px15),),
                                  ],
                                ),
                                SizedBox(
                                  height: AllDimensions.px20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomButton(bordercolor: AppColors.lightgreen, borderradius: AllDimensions.px10, boxcolor: AppColors.lightgreen, borderwidth: AllDimensions.px10, text: AllStrings.onlinebooking, styles: GoogleFonts.poppins(fontSize: AllDimensions.px15),btnWidth: AllDimensions.px150,),
                                    CustomButton(bordercolor: AppColors.lightblue, borderradius: AllDimensions.px10, boxcolor: AppColors.lightblue, borderwidth: AllDimensions.px10, text: AllStrings.inthelab, styles: GoogleFonts.poppins(fontSize: AllDimensions.px15), btnWidth: AllDimensions.px150)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AllDimensions.px20,
                      ),
                         CustomButton(
                        bordercolor: AppColors.lightred,
                        borderradius: AllDimensions.px10,
                        boxcolor: AppColors.lightred,
                        borderwidth: AllDimensions.px10,
                        text: AllStrings.makeappointment,
                        styles:
                            GoogleFonts.poppins(fontSize: AllDimensions.px15,color: AppColors.white),
                        btnWidth: AllDimensions.px344)

                    ],
                  ),
                  // color: AppColors.white,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
