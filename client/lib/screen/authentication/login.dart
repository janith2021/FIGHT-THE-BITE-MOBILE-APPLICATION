import 'package:client/models/Carousel.dart';

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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: AllDimensions.px10),
              child: Column(
                children: [
                  FutureBuilder(
                      future: CarouselImages(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Carousel>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomCarousel(
                                autoplay: false,
                                durationInSeconds: 0,
                                items: [
                                  Center(
                                      child: CircularProgressIndicator(
                                    color: AppColors.red,
                                  ))
                                ]),
                          );
                        } else {
                          final list = snapshot.data;
                          // debugPrint(list.toString());
                          final imglist = list!
                              .map((item) => (Image.network(item.image)))
                              .toList();
                          print(imglist);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomCarousel(
                                autoplay: true,
                                durationInSeconds: 1,
                                items: imglist),
                          );
                        }
                      }),
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
                  SizeBox().sizedBox10,
                  InkWell(
                    onTap: () async {
                      await provider.formvalidation(context);
                    },
                    child: CustomButton(
                        bordercolor: Colors.black,
                        borderradius: AllDimensions.px30,
                        boxcolor: AppColors.red,
                        borderwidth: 3,
                        btnWidth: MediaQuery.of(context).size.width * 0.9,
                        btnheight: AllDimensions.px50,
                        styles: GoogleFonts.aldrich(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AllDimensions.px30,
                        ),
                        text: AllStrings.login),
                  ),
                  SizeBox().sizedBox10,
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
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
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/reset");
                      },
                      child: Text(
                        AllStrings.resetPassword,
                        style: TextStyle(
                            fontSize: AllDimensions.px20, color: AppColors.red),
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
