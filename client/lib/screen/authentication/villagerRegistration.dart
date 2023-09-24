import '../../const/all_imports.dart';

class VillagerRegister extends StatelessWidget {
  static String get routename => "/nicvalidate/register";
  const VillagerRegister({super.key});

  getVillagerDetails() async{

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightyellow,
      body: Column(
        children: [
          Column(
            children: [
              Image.network("https://img.freepik.com/free-vector/forms-concept-illustration_114360-4947.jpg?w=740&t=st=1695068021~exp=1695068621~hmac=03b66f5fe8cc8cadb160f9748a04e68de6c440f84e2f5da3d12abe3abde84f03",width: MediaQuery.of(context).size.width,),
              Padding(
                padding: EdgeInsets.all(AllDimensions.px10),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(AllDimensions.px10),border: Border.all(color: AppColors.black)),
                  padding: EdgeInsets.all(AllDimensions.px30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("GS Division: "),
                          Text(""),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
