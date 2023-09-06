import 'package:client/models/campaign.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../const/all_imports.dart';

class ViewCampaignHistory extends StatelessWidget {
  static String get routename => "/organization/viewcampaignhistory";
  const ViewCampaignHistory({super.key});

  Future<List<Campaign>> getCampaignHistory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<Campaign> campaigns = [];
    var fullUrl = '${AllStrings.baseurl}/organization/campaigns';
    debugPrint(fullUrl);
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};
    var organizationdata = {'organizationid': preferences.getString("userid")};
    debugPrint(organizationdata.toString());
    try {
      var result = await http.post(Uri.parse(fullUrl),
          body: jsonEncode(organizationdata), headers: setHeaders());
      // var data = jsonDecode(result.body);
      if (result.statusCode == 200) {
        var data = jsonDecode(result.body);
        var campaignhistorydata = data["message"];
        for (var dat in campaignhistorydata) {
          var name = dat["name"];
          var date = dat["date"];
          var time = dat["time"];
          var status = dat["status"].toString();
          var location = dat["location"];
          DateTime datetime = DateTime.parse(date);
          String formatdate = DateFormat('yyyy-MM-dd').format(datetime);
          DateTime currentdatetime = DateTime.parse(DateTime.now().toString());
          if (datetime.isBefore(currentdatetime)) {
            Campaign addcampaign =
                Campaign(name, formatdate, time, status, location);
            campaigns.add(addcampaign);
          }
        }
        // return campaigns;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return campaigns;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Campaign History',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: FutureBuilder(
              future: getCampaignHistory(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Campaign>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    strokeWidth: AllDimensions.px10,
                    color: AppColors.red,
                  ));
                } else {
                  if (snapshot.hasError) {
                    return Text("Connection Failed! Please Try Again Later");
                  } else {
                    var list = snapshot.data;
                    return Padding(
                      padding: EdgeInsets.all(AllDimensions.px20),
                      child: ListView.builder(
                          itemCount: list!.length,
                          itemBuilder: (context, index) {
                            var item = list[index];
                            return Container(
                              padding: EdgeInsets.all(AllDimensions.px20),
                              decoration: BoxDecoration(color: AppColors.lightblue,borderRadius: BorderRadius.circular(AllDimensions.px10),boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)]),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text("Campaign Title:  ",style: GoogleFonts.poppins(fontSize: AllDimensions.px15,fontWeight: FontWeight.bold,),),
                                      Text(item.name,        
                                        style: GoogleFonts.poppins(
                                            fontSize: AllDimensions.px15,
                                            fontWeight: FontWeight.bold,color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AllDimensions.px10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Campaign Date :  ",style: GoogleFonts.poppins(fontSize: AllDimensions.px15,fontWeight: FontWeight.bold),),
                                      Text(item.date,
                                        style: GoogleFonts.poppins(
                                            fontSize: AllDimensions.px15,
                                            fontWeight: FontWeight.bold,color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                   SizedBox(
                                    height: AllDimensions.px10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Campaign Location:  ",
                                        style: GoogleFonts.poppins(
                                            fontSize: AllDimensions.px15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.location,
                                        style: GoogleFonts.poppins(
                                            fontSize: AllDimensions.px15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white),
                                      )
                                    ],
                                  ),
                                   SizedBox(
                                    height: AllDimensions.px10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Campaign Start Time:  ",
                                        style: GoogleFonts.poppins(
                                            fontSize: AllDimensions.px15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(item.time,
                                        style: GoogleFonts.poppins(
                                            fontSize: AllDimensions.px15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white),
                                      )
                                    ],
                                  ),
                                   SizedBox(
                                    height: AllDimensions.px10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Campaign Status:  ",
                                        style: GoogleFonts.poppins(
                                            fontSize: AllDimensions.px15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      if(item.status == "0") Container(padding: EdgeInsets.all(AllDimensions.px5), decoration: BoxDecoration(borderRadius: BorderRadius.circular(AllDimensions.px10),color: AppColors.orange,boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)]),child: Text("Pending",style: GoogleFonts.poppins(fontSize: AllDimensions.px15,fontWeight: FontWeight.bold,color: AppColors.white),))
                                      else if(item.status == "1") Container(
                                            padding: EdgeInsets.all(
                                                AllDimensions.px5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AllDimensions.px10),
                                                color: AppColors.green),child: Text("Approved",style: GoogleFonts.poppins(fontSize: AllDimensions.px15,fontWeight: FontWeight.bold,
                                                  color: AppColors.white),))
                                      else Container(
                                            padding: EdgeInsets.all(
                                                AllDimensions.px5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AllDimensions.px10),
                                                color: AppColors.red),
                                            child: Text("Rejected",style: GoogleFonts.poppins(fontSize: AllDimensions.px15,fontWeight: FontWeight.bold,
                                                  color: AppColors.white),))
                                      
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                }
              })),
    );
  }
}
