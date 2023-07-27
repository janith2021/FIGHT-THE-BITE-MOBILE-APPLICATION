import 'package:client/const/all_imports.dart';

class CustomCard extends StatelessWidget {
  final String imageicon;
  final String cardname;
  final TextAlign textalign;
  final int maxline;
  final TextStyle textstyle;
  final double? blurradius;
  final Color? boxcolor;
  final double? borderradius;
  final double? height;
  final double? width;

  const CustomCard(
      {super.key,
      required this.imageicon,
      required this.cardname,
      required this.textalign,
      required this.maxline,
      required this.textstyle,
      this.blurradius,
      this.boxcolor,
      this.borderradius,
      this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? AllDimensions.px184,
      width: width ?? MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(borderradius ?? AllDimensions.px10),
          color: boxcolor ?? AppColors.white,
          boxShadow: [BoxShadow(blurRadius: blurradius ?? 0)]),
      padding: EdgeInsets.all(AllDimensions.px10),
      child: Center(
        child: Column(
          children: [
            Image.asset(imageicon),
            Text(
              cardname,
              textAlign: textalign,
              maxLines: maxline,
              style: textstyle,
            ),
          ],
        ),
      ),
    );
  }
}
