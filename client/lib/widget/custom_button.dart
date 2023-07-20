// import 'dart:js_interop';

import '../const/all_imports.dart';

class CustomButton extends StatelessWidget {
  final Color boxcolor;
  final String text;
  final Color bordercolor;
  final double borderradius;
  final double borderwidth;
  final TextStyle styles;
  final double btnWidth;
  final double? btnheight;

  const CustomButton(
      {super.key,
      required this.bordercolor,
      required this.borderradius,
      required this.boxcolor,
      required this.borderwidth,
      required this.text,
      required this.styles,
      required this.btnWidth,
      this.btnheight
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AllDimensions.px50,
      height: btnheight,
      width: btnWidth,
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
        style: styles,
        // style: GoogleFonts.aldrich(
        //     color: fontcolor, fontSize: fontsize, fontWeight: FontWeight.bold),
      )),
    );
  }
}
