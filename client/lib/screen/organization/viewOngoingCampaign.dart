import 'package:client/models/campaign.dart';
import 'package:client/providers/view_campaign_provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/all_imports.dart';
import 'package:http/http.dart' as http;

class ViewOngoingCampign extends StatelessWidget {
  static String get routname => "campaign/viewongoing";
  const ViewOngoingCampign({super.key});

  getDivision(BuildContext context) async {
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    var email = prefer.getString('user');

    var emailbody = {'email': email};

    var fullurl = '${AllStrings.baseurl}/organization/view';
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    try {
      var response = await http.post(Uri.parse(fullurl),
          body: jsonEncode(emailbody), headers: setHeaders());
      if (response.statusCode == 200) {
        var body = await jsonDecode(response.body);
        var detail = body['user'];
        return detail['division'];
      }
    } catch (e) {
      print(e);
    }
  }

  // get all ongoing campaigns details

  Future<List<Campaign>> getCampignDatails(BuildContext context) async {
    var divition = await getDivision(context);
    List<Campaign> campaigns = [];

    var fullurl = '${AllStrings.baseurl}/organization/getallcampaigns';
    debugPrint(fullurl);
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var divisionData = {'division': divition};

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

          // debugPrint(formatdate);
          Campaign campaign =
              Campaign(name, formatdate, time, status, location);

          campaigns.add(campaign);
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
      return Scaffold(
        appBar: AppBar(leading: const BackButton(),title: const Text("Ongoing Campaigns"),backgroundColor: Colors.blue,),
        body: FutureBuilder(
            future: getCampignDatails(context),
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
                        padding: EdgeInsets.only(
                            top: AllDimensions.px100,
                            left: AllDimensions.px10,
                            right: AllDimensions.px10),
                        child: Container(
                          padding: EdgeInsets.all(AllDimensions.px10),
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(blurRadius: AllDimensions.px10)
                              ],borderRadius: BorderRadius.circular(AllDimensions.px10)),
                          child: Column(
                            children: [
                              Text(
                                item.name,
                                style: GoogleFonts.poppins(
                                    fontSize: AllDimensions.px18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(item.date,style: GoogleFonts.poppins(fontSize: AllDimensions.px18,fontWeight: FontWeight.bold),),
                              Text(item.location,style: GoogleFonts.poppins(fontSize: AllDimensions.px18,fontWeight: FontWeight.bold),),
                              Text(item.time,style: GoogleFonts.poppins(fontSize: AllDimensions.px18,fontWeight: FontWeight.bold),),
                              if (item.status == "0")  Padding(
                                padding: EdgeInsets.all(AllDimensions.px5),
                                child: Container(padding: EdgeInsets.all(AllDimensions.px10),decoration: BoxDecoration(color: AppColors.lightred,borderRadius: BorderRadius.circular(AllDimensions.px10)),child: Text("Pending",style: TextStyle(fontSize: AllDimensions.px20,fontWeight: FontWeight.bold),)),
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
      );
    });
  }
}
