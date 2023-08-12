import '../../const/all_imports.dart';

class Laboratory extends StatelessWidget {
  static String get routename => "/villager/laboratory";
  const Laboratory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: AllDimensions.px40,
              left: AllDimensions.px20,
              right: AllDimensions.px20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)]),
                // decoration: BoxDecoration(shape: BoxShape.rectangle),
                // color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                height: AllDimensions.px172,
                // alignment: Alignment(10, 10),a
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AllDimensions.px10),
                    child: Image.asset(
                      "Assets/villagers/laboratorypage/firstimage.png",
                      // alignment: Alignment.centerRight,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: AllDimensions.px172,

                      // height: AllDimensions.px100,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AllDimensions.px20),
                        child: Text(
                          "If You Want to get appoinment for a Lab Test",
                          style: GoogleFonts.poppins(
                              fontSize: AllDimensions.px20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AllDimensions.px5,
                            left: MediaQuery.of(context).size.width * 0.2),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        "villager/laboratory/appoinment");
                                  },
                                  child: CustomButton(
                                    bordercolor: AppColors.lightred,
                                    borderradius: AllDimensions.px20,
                                    boxcolor: AppColors.lightred,
                                    borderwidth: AllDimensions.px10,
                                    text: "Appoinment",
                                    styles: GoogleFonts.poppins(
                                        fontSize: AllDimensions.px15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white),
                                    btnWidth: AllDimensions.px200,
                                    btnheight: AllDimensions.px40,
                                  ))
                            ]),
                      )
                    ],
                  )
                ]),
              ),
              SizedBox(
                height: AllDimensions.px20,
              ),
              Container(
                height: 500,
                padding: EdgeInsets.all(AllDimensions.px10),
                width: MediaQuery.of(context).size.width,
                // color: AppColors.yellow,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AllDimensions.px20),
                    color: AppColors.white,
                    boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                            "Assets/villagers/laboratorypage/lablogo.png"),
                        Text(
                          "LabShield",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: AllDimensions.px18),
                        ),
                        CustomButton(
                            bordercolor: AppColors.lightred,
                            borderradius: AllDimensions.px20,
                            boxcolor: AppColors.lightred,
                            borderwidth: AllDimensions.px10,
                            text: "Online Booking",
                            styles: GoogleFonts.lato(
                                fontSize: AllDimensions.px10,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                            btnWidth: AllDimensions.px118)
                      ],
                    ),
                    SizedBox(
                      height: AllDimensions.px10,
                    ),
                    Expanded(
                        child: Image.asset(
                            "Assets/villagers/laboratorypage/report.png")),
                    SizedBox(
                      height: AllDimensions.px20,
                    ),
                    CustomButton(
                        bordercolor: AppColors.lightred,
                        borderradius: AllDimensions.px20,
                        boxcolor: AppColors.lightred,
                        borderwidth: AllDimensions.px10,
                        text: "Download",
                        styles: GoogleFonts.lato(
                            fontSize: AllDimensions.px10,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                        btnWidth: AllDimensions.px118)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
