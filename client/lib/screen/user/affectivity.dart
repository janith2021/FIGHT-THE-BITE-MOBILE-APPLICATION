import '../../const/all_imports.dart';

class Affectivity extends StatelessWidget {
  static String get routename => "villager/affectivity";
  const Affectivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AllDimensions.px20),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AllDimensions.px20),color: AppColors.white),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: AllDimensions.px70,
                            height: AllDimensions.px20,
                            color: AppColors.lightyellow,
                            child: const Center(child: Text("10%")),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: AllDimensions.px70,
                            height: AllDimensions.px20,
                            color: AppColors.darkyellow,
                            child: Center(child: Text("30%")),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: AllDimensions.px70,
                            height: AllDimensions.px20,
                            color: AppColors.orange,
                            child: Center(child: Text("50%")),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: AllDimensions.px70,
                            height: AllDimensions.px20,
                            color: AppColors.red,
                            child: Center(child: Text("65%")),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: AllDimensions.px70,
                            height: AllDimensions.px20,
                            color: AppColors.darkred,
                            child: Center(child: Text("85%")),
                          ),
                        ),
                      ],
                    ),
                    Image.asset("Assets/villagers/affectedpage/map.png"),
                  ],
                ),
              ),
              SizedBox(
                height: AllDimensions.px20,
              ),
              Container(
                padding: EdgeInsets.all(AllDimensions.px10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(AllDimensions.px10),boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("Assets/villagers/affectedpage/icon1.png"),
                    Text(AllStrings.totalvillagers,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                    Text("1540",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                    
                  ],
                ),
              ),
              SizedBox(
                height: AllDimensions.px20,
              ),
              Container(
                padding: EdgeInsets.all(AllDimensions.px10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AllDimensions.px10),
                    boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("Assets/villagers/affectedpage/icon2.png"),
                    Text(AllStrings.totalaffectedvillagers,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                    Text("230",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                    
                  ],
                ),
              ),
              SizedBox(
                height: AllDimensions.px20,
              ),
              Container(
                padding: EdgeInsets.all(AllDimensions.px10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AllDimensions.px10),
                    boxShadow: [BoxShadow(blurRadius: AllDimensions.px10)]),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("Assets/villagers/affectedpage/icon3.png",),
                    Text(
                      AllStrings.numberofdeaths,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "230",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AllDimensions.px20,),
              Container(
                padding: EdgeInsets.all(AllDimensions.px10),
                decoration: BoxDecoration(color: AppColors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AllDimensions.px10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("Assets/villagers/affectedpage/hint.png")
                        ],
                      ),
                    ),
                    Image.asset("Assets/villagers/affectedpage/chart.png")
                  ],
                ),
      
              ),
              SizedBox(
                height: AllDimensions.px10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: AppColors.white),
                child: Padding(
                  padding: EdgeInsets.all(AllDimensions.px10),
                  child: Column(
                    children: [
                      Text(AllStrings.growinggraph,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                      Image.asset("Assets/villagers/affectedpage/chart2.png"),
                      Padding(
                        padding: EdgeInsets.all(AllDimensions.px10),
                        child: Image.asset("Assets/villagers/affectedpage/hint2.png"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
