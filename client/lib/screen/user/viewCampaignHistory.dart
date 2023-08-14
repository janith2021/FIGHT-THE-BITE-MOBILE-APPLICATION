import '../../const/all_imports.dart';

class UserCampaign extends StatelessWidget {
  static String get routename => "/villager/campaigns";
  const UserCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VIEW CAMPAIGN HISTRY',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  width: 450,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(10) ,child :Text("Campaign name : Suwasahana Campaign")),
                      Padding(padding:EdgeInsets.all(10), child :Text("Campaign date : 08/19/2023")),
                      Padding(child: Text("Campaign location : matara"),padding: EdgeInsets.all(10),),
                      Padding(child: Text("Campaign time : 8.00 A.M"),padding: EdgeInsets.all(10),),
                      // Padding(child: Text("Campaign status : Approved"),padding: EdgeInsets.all(10),),

                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AllDimensions.px10),
                      color: Color.fromARGB(255, 244, 242, 236),
                      boxShadow: [BoxShadow(blurRadius: 0)]),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  width: 450,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(10) ,child :Text("Campaign name : Janashakthi Campaign")),
                      Padding(padding:EdgeInsets.all(10), child :Text("Campaign date : 08/16/2023")),
                      Padding(child: Text("Campaign location : matara"),padding: EdgeInsets.all(10),),
                      Padding(child: Text("Campaign time : 9.00 A.M"),padding: EdgeInsets.all(10),),
                      // Padding(child: Text("Campaign status : Pending"),padding: EdgeInsets.all(10),),

                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AllDimensions.px10),
                      color: Color.fromARGB(255, 244, 242, 236),
                      boxShadow: [BoxShadow(blurRadius: 0)]),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  width: 450,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(10) ,child :Text("Campaign name : Shakthi Campaign")),
                      Padding(padding:EdgeInsets.all(10), child :Text("Campaign date : 08/17/2023")),
                      Padding(child: Text("Campaign location : Tangalle"),padding: EdgeInsets.all(10),),
                      Padding(child: Text("Campaign time : 8.30 A.M"),padding: EdgeInsets.all(10),),
                      // Padding(child: Text("Campaign status : Rejected"),padding: EdgeInsets.all(10),),

                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AllDimensions.px10),
                      color: Color.fromARGB(255, 244, 242, 236),
                      boxShadow: [BoxShadow(blurRadius: 0)]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
