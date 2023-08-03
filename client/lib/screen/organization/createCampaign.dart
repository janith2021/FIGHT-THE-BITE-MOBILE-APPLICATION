import 'package:client/const/all_imports.dart';
import 'package:flutter/widgets.dart';

class CreateCampaign extends StatelessWidget {
  static String get routename => "organization/create";
  const CreateCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text("HI"),
        ],
      )),
    );
  }
}
