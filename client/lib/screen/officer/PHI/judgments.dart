import 'package:client/const/all_imports.dart';

class Judgments extends StatefulWidget {
  static String get routename => "/phi/judgment";
  const Judgments({super.key});

  @override
  State<Judgments> createState() => _JudgmentsState();
}

class _JudgmentsState extends State<Judgments> {

  Future getCompetitors() async {
    var competitors = [{
      'name' : 'kamal',
      'address' : 'mathara',
      'houseNumber' : '219'
    },
    {
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    },{
      'name' : 'charith',
      'address' : 'colombo',
      'houseNumber' : '213'
    }];

    return competitors;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Competitors",
          style: GoogleFonts.poppins(),
        ),
        // automaticallyImplyLeading: false,
        backgroundColor: AppColors.lightred,
      ),
      backgroundColor: AppColors.lightgrey,
      body: Padding(
          padding: EdgeInsets.all(AllDimensions.px20),
          child: FutureBuilder(
            future: getCompetitors(),
            builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();

            } else if (snapshot.hasError) {
              return Text('Error : ${snapshot.error.toString()}');

            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    // SizedBox(height: AllDimensions.px100,);
                    return Padding(
                      padding: EdgeInsets.only(bottom: AllDimensions.px10),
                      child: ListTile(
                        
                        title: Text(snapshot.data[index]['name'],
                          style: GoogleFonts.poppins(),),
                        subtitle: Text(snapshot.data[index]['address'],
                          style: GoogleFonts.poppins(),),
                        // contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        tileColor: AppColors.lighorange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        
                      ),
                    );
                    // SizedBox(height: ,);
                  });
            }
          })),
    ));
  }
}
