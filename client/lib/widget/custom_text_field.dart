import '../const/all_imports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final String errorText;
  final IconData iconData;
  final Widget? suffixIcon;
  final bool obscureText;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.iconData,
      required this.label,
      required this.errorText,
      this.obscureText = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              label: Text(label),
              prefixIcon: Icon(iconData),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.red)),
              prefixIconColor: Colors.red,
            ),
          ),
        ),
        SizeBox().sizedBox5,
        if (errorText.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                errorText,
                style:
                    TextStyle(color: AppColors.red, fontSize: AllDimensions.px15),
              ),
            ],
          ),
      ],
    );
  }
}
