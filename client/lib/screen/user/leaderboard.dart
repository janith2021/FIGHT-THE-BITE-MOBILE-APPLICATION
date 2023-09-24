// import 'package:profile_photo/profile_photo.dart';
import 'package:client/models/Competitor.dart';
import 'package:hotreloader/hotreloader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../const/all_imports.dart';
import 'package:http/http.dart' as http;

class LeaderBoard extends StatefulWidget {
  
  static String get routename => "villager/leaderboard";
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  final List<String> encodedImages = [];

  Future<void> pickImage() async {
    // final reloader = await HotReloader.create();
    final picker = ImagePicker();

    final List<XFile> pickedFiles = await picker.pickMultiImage();
    // print(pickedFiles);

    // print(pickedFiles);
    if (pickedFiles != null) {
      final List<String> newEncodedImages = [];
      for (var pickfile in pickedFiles) {
        var encodeImage = await pickfile.readAsBytes();
        var encodedImage = base64Encode(encodeImage);
        newEncodedImages.add(encodedImage);

        // print(encodedImages);
      }
      setState(() {
        encodedImages.addAll(newEncodedImages);
        showUploardPhoto(context);
      });
    } else {
      throw Exception('No images selected');
    }
    // print(encodedImages);
  }

  Future showUploardPhoto(context) async {
    // final reloader = await HotReloader.create();
    // reloader.stop();
    return showDialog(
        context: context,
        builder: (Builder) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: AlertDialog(
                title: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Text(
                        "Upload the Photo",
                        style: GoogleFonts.poppins(
                            fontSize: AllDimensions.px20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightred),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 230),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 30,
                          ),
                        ))
                  ],
                ),
                content: Container(
                  width: 250,
                  height: 300,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: Text("Camera"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: encodedImages.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Image.memory(
                                      base64Decode(encodedImages[index]),
                                      height: 150,
                                      width: 150,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              })),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            print(10);
                            uploardPickedImages();
                          },
                          child: Text(
                            "Upload",
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<List<Competitor>> getUserDetails() async {
    List<Competitor> userDetails = [];
    late var details;
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var email = prefer.getString("email");
    var body = {"email" : email};

    var fulUrl = "${AllStrings.baseurl}/villager/getuserdetails";
    setHeaders() => {
      'Content-type' : 'application/json' , 'Accept' : 'application/json'
    };

    var response = await http.post(Uri.parse(fulUrl) , body: jsonEncode(body) , headers: setHeaders());

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);

      details = data['message'];
      var name = details['name'].toString();
      var id = details['_id'];
      var nic = details['nic'];
      var email = details['email'];
      var houseHoldNo = details['houseHoldNo'];
      var divisionNumber = details['divisionNumber'];
      // var nic = details['nic'];
      // print(details);
      // var id = details._
      Competitor p = Competitor(name: name, email: email,id: id, nic: nic , houseHoldNo: houseHoldNo ,divisionNumber: divisionNumber );
      // print(data['message']);
      userDetails.add(p);
    }
    // return details;
    return userDetails;
  }

  Future uploardPickedImages() async {
    var fullurl = "${AllStrings.baseurl}/villager/uploardimages";
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};

    var data = getUserDetails();
    // debugPrint();

    
  
    var body = {"images": encodedImages};

    var response = await http.post(Uri.parse(fullurl),
        body: jsonEncode(body), headers: setHeaders());

    if (response.statusCode == 200) {
      print("Image upload Successfully");
    } else {
      print("falied upload Image");
    }
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightred,
        toolbarHeight: AllDimensions.px50,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: AllDimensions.px10,
            bottom: AllDimensions.px10,
            left: AllDimensions.px20,
            right: AllDimensions.px20),
        child: Column(
          children: [
            Container(
              color: AppColors.cream,
              height: height * 0.78,
            ),
            SizedBox(
              height: AllDimensions.px15,
            ),
            Container(
              // color: AppColors.darkred,
              height: height * 0.1,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(AllDimensions.px10)),
                color: const Color.fromARGB(255, 230, 224, 224),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 137, 133, 133),
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.032, left: width * 0.05),
                    child: Text(
                      "Upload Your Images",
                      style: GoogleFonts.poppins(
                          fontSize: AllDimensions.px20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.02, left: width * 0.6),
                    child: ElevatedButton(
                        onPressed: () async {
                          // Navigator.pushNamed(context, '');
                          await showUploardPhoto(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.lightred),
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size(100, 50),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          "Upload",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  )
                ],
              ),
            ),

            FutureBuilder(
              future: uploardPickedImages(),
              builder: (context ,AsyncSnapshot snapshot){
                return Container();
              })
          ],
        ),
      ),
    ));
  }
}
