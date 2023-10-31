import 'package:client/models/campaign.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/all_imports.dart';

class UserCampaign extends StatelessWidget {
  List<Campaign> campaigns = [];
  static String get routename => "/villager/campaigns";
  UserCampaign({super.key});

  Future<List<Campaign>> getcampaigns() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var divisionnumber = prefs.getString('divisionNumber');
    var fullurl = "${AllStrings.baseurl}//villager/getcampaigns";
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};
    var data = {'divisionnumber': divisionnumber};
    var res = await http.post(Uri.parse(fullurl),
        body: jsonEncode(data), headers: setHeaders());
    var results = await jsonDecode(res.body);
    for (var result in results['message']) {
      var name = result['name'].toString();
      var date = result['date'].toString();
      var time = result['time'].toString();
      var location = result['location'].toString();
      var status = result['status'].toString();

      Campaign campaign = Campaign(name, date, time, status, location);
      campaigns.add(campaign);
    }
    // debugPrint(divisionnumber);
    return campaigns;
    // var data = await http.post("h");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            AllStrings.campaign,
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getcampaigns(),
            builder: (context, AsyncSnapshot<List<Campaign>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(backgroundColor: Colors.red,strokeWidth: AllDimensions.px5),
                    ],
                  ),
                );
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  // return ListView.builder(itemCount: ,itemBuilder: ((context, index) {
                  var data = snapshot.data;
                  if (data!.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.all(AllDimensions.px50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              "https://img.freepik.com/free-vector/hand-drawn-no-data-illustration_23-2150696452.jpg?w=740&t=st=1698733983~exp=1698734583~hmac=17a95c7317433fe8fa029f1d60420143b1ff2282cda3e2150f20d54ce5d35aa9"),
                          Text("No Campaigns Found in Your Division",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: AllDimensions.px15),),
                        ],
                      ),
                    );
                  }
                  // }));
                  return Text("campaigns");
                }
              }
            }));
  }
}
