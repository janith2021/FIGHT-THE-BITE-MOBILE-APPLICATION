import 'package:client/models/Carousel.dart';
import 'package:constrained_scroll_view/constrained_scroll_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/all_imports.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  static String get routeName => "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController passwordcontrol = TextEditingController();
    // bool obscuretext = false;
    // void hello() {
    //   passwordcontrol.text = "";
    //   // setState(() {});
    // }

    Future<List<Carousel>> CarouselImages() async {
      var url = "${AllStrings.baseurl}/carousel";
      var res = await http.get(Uri.parse(url));
      Map result = await jsonDecode(res.body);
      List<dynamic> images = result["image"];
      List<Carousel> imagelist = [];
      for (var img in images) {
        var image = img["image"];
        var caption = img["caption"];
        var status = img["status"];
        if (img["status"] == "login") {
          Carousel carousel = Carousel(image, caption, status);
          imagelist.add(carousel);
        }
      }
      return imagelist;
    }

    // Stream<List<Carousel>> CarouselImages() async {
    //   var url = "${AllStrings.baseurl}/carousel";
    //   var res = await http.get(Uri.parse(url));
    //   Map result = jsonDecode(res.body);
    //   List<dynamic> images = result["image"];
    //   List<Carousel> imglist = [];
    //   for (var img in images) {
    //     var image = img["image"];
    //     var caption = img["caption"];
    //     var status = img["status"];
    //     if (img["status"] == "login") {
    //       Carousel carousel = Carousel(image, caption, status);
    //       imglist.add(carousel);
    //     }
    //   }
    //   yield imglist;
    // }

    return Consumer<LoginProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ConstrainedScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: AllDimensions.px40),
              child: Column(
                children: [
                  CustomCarousel(autoplay: true, durationInSeconds: 2, items: [
                    Image.network("https://1.bp.blogspot.com/-ZmU2_PllkxM/WXGIiW5STaI/AAAAAAAABy0/sobPH8_meUE6ofwhbkOnXW-RZ2bBVQyJQCEwYBhgL/s1600/2017_dengue_campaign_03.jpg",fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
                    Image.network("https://cmb.ac.lk/wp-content/uploads/dengue-free-environment-of-the-uoc-04.jpg",fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width),
                    Image.network("https://www.sjp.ac.lk/wp-content/uploads/2015/11/JapuraMedia-6905.jpg",
                      fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width
                    ),
                    Image.network("https://med.pdn.ac.lk/events/2016/june/data1/images/14.jpg",
                      fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width
                    ),
                  ]),
                  SizedBox(
                    height: AllDimensions.px80,
                  ),
                  CustomTextField(
                    controller: provider.emailController,
                    hintText: AllStrings.emailHint,
                    iconData: Icons.email,
                    label: AllStrings.email,
                    errorText: provider.emailError,
                  ),
                  SizeBox().sizedBox10,
                  CustomTextField(
                    controller: provider.passwordController,
                    hintText: AllStrings.passwordHint,
                    obscureText: provider.obscureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.updateobscureText();
                      },
                      icon: Icon(provider.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    iconData: Icons.password,
                    label: AllStrings.password,
                    errorText: provider.passwordError,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: AllDimensions.px20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/reset");
                            },
                            child: Text(
                              AllStrings.resetPassword,
                              style: TextStyle(
                                  fontSize: AllDimensions.px20,
                                  color: AppColors.red),
                            ))
                      ],
                    ),
                  ),
                  SizeBox().sizedBox20,
                  InkWell(
                    onTap: () async {
                      await provider.formvalidation(context);
                    },
                    child: CustomButton(
                        bordercolor: AppColors.lightred,
                        borderradius: AllDimensions.px50,
                        boxcolor: AppColors.lightred,
                        borderwidth: 3,
                        btnWidth: MediaQuery.of(context).size.width * 0.9,
                        btnheight: AllDimensions.px39,
                        styles: GoogleFonts.lato(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AllDimensions.px20,
                        ),
                        text: AllStrings.login,
                        shadow: AllDimensions.px10),
                  ),
                  SizeBox().sizedBox20,
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      await prefs.clear();
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, "/nic/validate");
                    },
                    child: RichText(
                      text: TextSpan(
                          text: AllStrings.dontHaveAccount,
                          style: TextStyle(
                              color: AppColors.purple,
                              fontSize: AllDimensions.px20),
                          children: [
                            TextSpan(
                                text: AllStrings.signUp,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: AllDimensions.px20))
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
