import 'package:shared_preferences/shared_preferences.dart';

import '../../const/all_imports.dart';
import 'package:http/http.dart' as http;

class Profile extends StatelessWidget {
  // TextEditingController controllername = Te
  static String get routename => "/user/profile";
  Profile({super.key});

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('email');
    debugPrint(user.toString());

    var fullurl = "${AllStrings.baseurl}/villager/$user";
    var result = await http.get(Uri.parse(fullurl));
    var response = jsonDecode(result.body);
    var users = response['user'];
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Villager Profile",
          style: GoogleFonts.poppins(
            fontSize: AllDimensions.px20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.red,
        centerTitle: true,
        shadowColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: getUser(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  Container(height: MediaQuery.of(context).size.height,child: Center(child: CircularProgressIndicator(backgroundColor: AppColors.red)));
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(AllDimensions.px10),
                        child: Container(
                          color: AppColors.lightpink,
                          child: Column(
                             children: [
                              TextField(controller: ,)
                              // Text(snapshot.data['name'].toString()),
                              // Text(snapshot.data['nic'].toString()),
                              // Text(snapshot.data['contact'].toString()),
                              // Text(snapshot.data['email'].toString()),
                              // Text(snapshot.data['gsDivision'].toString()),
                              // Text(snapshot.data['divisionNumber'].toString()),
                            ],
                          ),
                        ),
                      );
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
