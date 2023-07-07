import '../const/all_imports.dart';

class CustomButton extends StatelessWidget {
  final Color boxcolor;
  final String text;
  final Color bordercolor;
  final Color fontcolor;
  final double fontsize;
  final double borderradius;
  final double borderwidth;
  
  const CustomButton(
      {super.key,
      required this.bordercolor,
      required this.borderradius,
      required this.boxcolor,
      required this.borderwidth,
      required this.fontcolor,
      required this.fontsize,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AllDimensions.px50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: boxcolor,
          borderRadius: BorderRadius.circular(borderradius),
          border: Border.all(
            color: bordercolor,
            width: borderwidth,
          )),
      child: Center(
          child: Text(
        text,
        style: GoogleFonts.aldrich(
            color: fontcolor, fontSize: fontsize, fontWeight: FontWeight.bold),
      )),
    );
  }
}
