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
  final double? shadow;

  const CustomButton(
      {super.key,
      required this.bordercolor,
      required this.borderradius,
      required this.boxcolor,
      required this.borderwidth,
      required this.text,
      required this.styles,
      required this.btnWidth,
      this.btnheight,
      this.shadow,
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
          ),boxShadow: [BoxShadow(blurRadius: shadow ?? AllDimensions.px10)]),
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
