import 'package:client/models/campaign.dart';
import 'package:client/providers/view_campaign_provider.dart';
import 'package:date_only_field/date_only_field.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/all_imports.dart';
import 'package:http/http.dart' as http;

class ViewOngoingCampign extends StatelessWidget {
  static String get routname => "campaign/viewongoing";
  const ViewOngoingCampign({super.key});

//   getDivision(BuildContext context) async {
//     final SharedPreferences prefer = await SharedPreferences.getInstance();
//     var email = prefer.getString('user');

//     var emailbody = {'email': email};

//     var fullurl = '${AllStrings.baseurl}/organization/view';
//     setHeaders() =>
//         {'Content-Type': 'application/json', 'Accept': 'application/json'};

//     try {
//       var response = await http.post(Uri.parse(fullurl),
//           body: jsonEncode(emailbody), headers: setHeaders());
//       if (response.statusCode == 200) {
//         var body = await jsonDecode(response.body);
//         var detail = body['user'];
//         return detail['division'];
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

  // get all ongoing campaigns details

  Future<List<Campaign>> getCampaignDatails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var divition = await getDivision(context);
    List<Campaign> campaigns = [];

    var fullurl = '${AllStrings.baseurl}/organization/campaigns';
    debugPrint(fullurl);
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var divisionData = {'organizationid': prefs.getString("userid")};

    try {
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(divisionData), headers: setHeaders());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var allData = data['message'];

        for (var dat in allData) {
          // if (tDate.isAfter(cDate)) {
          var name = dat['name'];
          var campaigndate = dat['date'];
          var time = dat['time'];
          var status = dat['status'].toString();
          var location = dat['location'];
          // var realdate =
          //     DateTime(campaigndate.year, campaigndate.month, campaigndate.day);
          // String formatdate = DateFormat('M/d/y').format(realdate);
          DateTime datetime = DateTime.parse(campaigndate);
          String formatdate = DateFormat('yyyy-MM-dd').format(datetime);
          DateTime currentdatetime = DateTime.parse(DateTime.now().toString());
          // String currentformatdate =
          //     DateFormat('yyyy-MM-dd').format(currentdatetime);
          // debugPrint(currentformatdate);
          // debugPrint(formatdate);

          // var campaigndates = datetime.toString();
          // var currentdate = DateTime.now();
          // debugPrint(campaigndate);
          // debugPrint(formatdate);
          // if()
          // if()
          if(datetime.isAfter(currentdatetime)){
            Campaign campaign =
                Campaign(name, formatdate, time, status, location);

            campaigns.add(campaign);
          }
          
        }

        // // debugPrint(campaigns.toString(
      }
    } catch (e) {
      print(e);
    }
    return campaigns;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewCampaignProvider>(builder: (context, provider, _) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            centerTitle: true,
            shadowColor: AppColors.red,
            title: Text("Ongoing Campaigns",style: GoogleFonts.poppins(fontSize: AllDimensions.px20,fontWeight: FontWeight.bold),),
            backgroundColor: AppColors.lightred,
          ),
          body: FutureBuilder(
              future: getCampaignDatails(context),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Campaign>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red,
                      strokeWidth: AllDimensions.px10,
                    ),
                  );
                } else {
                  if (snapshot.hasError) {
                    return const Text("Connection Failed");
                  } else {
                    // debugPrint(snapshot.data);
                    var list = snapshot.data;
                    return ListView.builder(
                      itemCount: list!.length,
                      itemBuilder: (context, index) {
                        var item = list[index];
                        return Padding(
                          padding: EdgeInsets.all(AllDimensions.px10),
                          child: Container(
                            padding: EdgeInsets.all(AllDimensions.px40),
                            width: MediaQuery.of(context).size.width * 0.1,
                            decoration: BoxDecoration(
                                color: AppColors.lightblue,
                                boxShadow: [
                                  BoxShadow(blurRadius: AllDimensions.px10)
                                ],
                                borderRadius:
                                    BorderRadius.circular(AllDimensions.px10)),
                            child: Column(
                              children: [
                                Text(
                                  item.name,
                                  style: GoogleFonts.poppins(
                                      fontSize: AllDimensions.px18,
                                      fontWeight: FontWeight.bold,color: AppColors.white),
                                ),
                                Text(
                                  item.date,
                                  style: GoogleFonts.poppins(
                                      fontSize: AllDimensions.px18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white,
                                      ),
                                ),
                                Text(
                                  item.location,
                                  style: GoogleFonts.poppins(
                                    fontSize: AllDimensions.px18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white
                                  ),
                                ),
                                Text(
                                  item.time,
                                  style: GoogleFonts.poppins(
                                      fontSize: AllDimensions.px18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white),
                                ),
                                if (item.status == "0")
                                  Padding(
                                    padding: EdgeInsets.all(AllDimensions.px5),
                                    child: Container(
                                        padding:
                                            EdgeInsets.all(AllDimensions.px10),
                                        decoration: BoxDecoration(
                                            color: AppColors.orange,
                                            borderRadius: BorderRadius.circular(
                                                AllDimensions.px10)),
                                        child: Text(
                                          "Pending",
                                          style: TextStyle(
                                              fontSize: AllDimensions.px20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white),
                                        )),
                                  )
                                else if (item.status == "1")
                                  Padding(
                                    padding: EdgeInsets.all(AllDimensions.px5),
                                    child: Container(
                                        padding:
                                            EdgeInsets.all(AllDimensions.px10),
                                        decoration: BoxDecoration(
                                            color: AppColors.lightgreen,
                                            borderRadius: BorderRadius.circular(
                                                AllDimensions.px10)),
                                        child: Text(
                                          "Approved",
                                          style: TextStyle(
                                              fontSize: AllDimensions.px20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white),
                                        )),
                                  )
                                else
                                  Padding(
                                    padding: EdgeInsets.all(AllDimensions.px5),
                                    child: Container(
                                        padding:
                                            EdgeInsets.all(AllDimensions.px20),
                                        decoration: BoxDecoration(
                                            color: AppColors.lightred,
                                            borderRadius: BorderRadius.circular(
                                                AllDimensions.px10)),
                                        child: Text(
                                          "Rejected",
                                          style: TextStyle(
                                              fontSize: AllDimensions.px20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white),
                                        )),
                                  ),
                                  SizedBox(height: AllDimensions.px10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(onTap: (){
                                        
                                      },child: CustomButton(bordercolor: AppColors.green, borderradius: AllDimensions.px10, boxcolor: AppColors.green, borderwidth: AllDimensions.px10, text: "Update", styles: GoogleFonts.poppins(fontSize: AllDimensions.px18,fontWeight: FontWeight.bold,color: AppColors.white), btnWidth: MediaQuery.of(context).size.width * 0.25)),
                                      CustomButton(bordercolor: AppColors.red, borderradius: AllDimensions.px10, boxcolor: AppColors.red, borderwidth: AllDimensions.px10, text: "Delete", styles: GoogleFonts.poppins(fontSize: AllDimensions.px18,fontWeight: FontWeight.bold,color: AppColors.white), btnWidth: MediaQuery.of(context).size.width * 0.25),
                                    ],
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    // return Text("Hi");
                  }
                }
              }),
        ),
      );
    });
  }
}
