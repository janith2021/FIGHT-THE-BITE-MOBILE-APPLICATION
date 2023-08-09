// import 'dart:js_interop';

import 'package:client/const/all_imports.dart';

class CustomDialogBox extends StatefulWidget {
  final String dialogtitle;
  final TextEditingController controller1;
  final String hintText1;
  final IconData iconData1;
  final String label1;
  final String errorText1;
  final String submitBtnText;
  final String cancelBtnText;
  final TextEditingController? controller2;
  final String? hintText2;
  final IconData? iconData2;
  final String? label2;
  final String? errorText2;
  final Color submitbtncolor;
  final Color cancelbtncolor;
  final TextStyle btntextstyle;
  final Color? boxbgcolor;
  final double? contentpadding;
  final double? titlepadding;
  final double? submitbtnpadding;
  final double? cancelbtnpadding;
  // final Color cancelbtncolor;
  const CustomDialogBox({
    super.key,
    required this.dialogtitle,
    required this.controller1,
    required this.hintText1,
    required this.iconData1,
    required this.label1,
    required this.errorText1,
    required this.submitBtnText,
    required this.cancelBtnText,
    this.controller2,
    this.hintText2,
    this.errorText2,
    this.iconData2,
    this.label2,
    required this.submitbtncolor,
    required this.cancelbtncolor,
    required this.btntextstyle,
    this.boxbgcolor,
    this.contentpadding,
    this.titlepadding,
    this.cancelbtnpadding,
    this.submitbtnpadding,
  });

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(widget.dialogtitle)),
      backgroundColor: widget.boxbgcolor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AllDimensions.px10)),
      content: Padding(
        padding: EdgeInsets.all(widget.contentpadding ?? 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
                controller: widget.controller1,
                hintText: widget.hintText1,
                iconData: widget.iconData1,
                label: widget.label1,
                errorText: widget.errorText1),
            if (widget.label2 != null)
              CustomTextField(
                  controller: widget.controller2!,
                  hintText: widget.hintText2!,
                  iconData: widget.iconData2!,
                  label: widget.label2!,
                  errorText: widget.errorText2!)
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(widget.submitbtncolor),padding: MaterialStatePropertyAll(EdgeInsets.all(widget.submitbtnpadding ?? 10))),
          child: Text(
            widget.submitBtnText,
            style: widget.btntextstyle,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(widget.cancelbtncolor),
              padding:
                  MaterialStatePropertyAll(EdgeInsets.all(widget.cancelbtnpadding ?? 10))),
          child: Text(
            widget.cancelBtnText,
            style: widget.btntextstyle,
          ),
        ),
      ],
    );
  }
}
