import 'package:client/const/all_imports.dart';
// import 'package:cr_calendar/cr_calendar.dart';
// import 'package:event_schedule_calendar/event_schedule_calendar.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../widget/custom_card.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

class CreateCampaign extends StatelessWidget {
  static String get routename => "organization/create";
  const CreateCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AllDimensions.px20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.lightgrey,
                      boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)],
                      borderRadius: BorderRadius.circular(AllDimensions.px10)),
                  padding: EdgeInsets.all(AllDimensions.px20),
                  child: SfCalendar(
                    allowAppointmentResize: true,
                    firstDayOfWeek: 1,
                    backgroundColor: AppColors.yellow,
                    view: CalendarView.month,
                    cellBorderColor: AppColors.purple,
                    blackoutDates: [DateTime.now().add(Duration(days: 2))],
                    todayHighlightColor: AppColors.green,
                    headerHeight: AllDimensions.px40,
                    headerStyle: CalendarHeaderStyle(
                        textAlign: TextAlign.center,
                        textStyle:
                            GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    showTodayButton: true,
                    todayTextStyle:
                        GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    appointmentTextStyle:
                        GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    blackoutDatesTextStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, color: AppColors.red),
                    allowedViews: const [
                      CalendarView.day,
                      CalendarView.month,
                      CalendarView.schedule
                    ],                  
                  ),
                ),
                SizedBox(height: AllDimensions.px20,),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/organization/create/form");
                  },
                  child: CustomCard(
                      boxcolor: AppColors.white,
                      imageicon:
                          "Assets/organization/createcampaign/create.jpeg",
                      cardname: AllStrings.createcampaign,
                      textalign: TextAlign.center,
                      maxline: 2,
                      textstyle: GoogleFonts.poppins(
                          fontSize: AllDimensions.px18,
                          fontWeight: FontWeight.bold),width: MediaQuery.of(context).size.width,),
                ),
                SizedBox(height: AllDimensions.px20,),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/organization/viewcampaignhistory");
                  },
                  child: CustomCard(
                      boxcolor: AppColors.white,
                      imageicon:
                          "Assets/organization/createcampaign/history.jpeg",
                      cardname: AllStrings.viewcampaignhistory,
                      textalign: TextAlign.center,
                      maxline: 2,
                      textstyle: GoogleFonts.poppins(
                          fontSize: AllDimensions.px18,
                          fontWeight: FontWeight.bold),width: MediaQuery.of(context).size.width,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
