// import 'package:flutter/foundation.dart';

// import 'package:art_sweetalert/art_sweetalert.dart';

import 'package:client/providers/guestregistration.dart';

import '../../const/all_imports.dart';

class GuestSignUp extends StatefulWidget {
  static String get routename => "/guest/register";

  const GuestSignUp({super.key});

  @override
  State<GuestSignUp> createState() => _GuestSignUpState();
}

class _GuestSignUpState extends State<GuestSignUp> {
  final formkey = GlobalKey<FormState>();
  // int _activestepindex = 0;
  List<Step> stepList(GusetRegistrationProvider provider) => [
        Step(
            state: StepState.complete,
            isActive: _activeindex > 0,
            title: const Text("Grama Niladhari Division Details"),
            // label: Text("Grama Niladhari"),
            content: Center(
              child: Column(
                children: [
                  CustomTextField(
                      controller: provider.controllernewgsdivision,
                      hintText: "New Grama Niladhari Division Name",
                      iconData: Icons.nine_mp_outlined,
                      label: "New Grama Niladhari Division Name",
                      errorText: provider.newgsdivisionerror),
                  // debugPrint();
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllernewdivisionnumber,
                      hintText: "New Grama Niladhari Division Number",
                      iconData: Icons.nine_mp_outlined,
                      label: "New Grama Niladhari Division Number",
                      errorText: provider.newdivisionnumbererror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controlleroldgsdivision,
                      hintText: "Old Grama Niladhari Division Name",
                      iconData: Icons.nine_mp_outlined,
                      label: "Old Grama Niladhari Division Name",
                      errorText: provider.oldgsdivisionerror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeindex > 1,
            title: const Text("Guest Villager Details"),
            content: Center(
              child: Column(
                children: [
                  CustomTextField(
                      controller: provider.controllername,
                      hintText: "Name",
                      iconData: Icons.nine_mp_outlined,
                      label: "Name",
                      errorText: provider.newaddresserror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllernewaddress,
                      hintText: "Address",
                      iconData: Icons.nine_mp_outlined,
                      label: "Address",
                      errorText: provider.newaddresserror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllernic,
                      hintText: "NIC Number",
                      iconData: Icons.nine_mp_outlined,
                      label: "NIC Number",
                      errorText: provider.nicerror),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllerage,
                      hintText: "Age",
                      iconData: Icons.nine_mp_outlined,
                      label: "Age",
                      errorText: provider.oldgsdivisionerror),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeindex > 2,
            title: const Text("Family Member 1 Details"),
            content: Center(
              child: Column(
                children: [
                  CustomTextField(
                      controller: provider.controllermember1name,
                      hintText: "Name",
                      iconData: Icons.nine_mp_outlined,
                      label: "Name",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember1nic,
                      hintText: "NIC",
                      iconData: Icons.nine_mp_outlined,
                      label: "NIC",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember1mobile,
                      hintText: "Mobile Number",
                      iconData: Icons.nine_mp_outlined,
                      label: "Mobile Number",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember1gender,
                      hintText: "Gender",
                      iconData: Icons.nine_mp_outlined,
                      label: "Gender",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                ],
              ),
            )),
        // SizedBox(height: AllDimensions.px20,),
        Step(
            state: StepState.complete,
            isActive: _activeindex > 3,
            title: const Text("Family Member 2 Details"),
            content: Center(
              child: Column(
                children: [
                  CustomTextField(
                      controller: provider.controllermember2name,
                      hintText: "Name",
                      iconData: Icons.nine_mp_outlined,
                      label: "Name",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember2nic,
                      hintText: "NIC",
                      iconData: Icons.nine_mp_outlined,
                      label: "NIC",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember2gender,
                      hintText: "Gender",
                      iconData: Icons.nine_mp_outlined,
                      label: "Gender",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeindex > 4,
            title: const Text("Family Member 3 Details"),
            content: Center(
              child: Column(
                children: [
                  CustomTextField(
                      controller: provider.controllermember3name,
                      hintText: "Name",
                      iconData: Icons.nine_mp_outlined,
                      label: "Name",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember3nic,
                      hintText: "NIC",
                      iconData: Icons.nine_mp_outlined,
                      label: "NIC",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember3gender,
                      hintText: "Gender",
                      iconData: Icons.nine_mp_outlined,
                      label: "Gender",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeindex > 5,
            title: const Text("Family Member 4 Details"),
            content: Center(
              child: Column(
                children: [
                  CustomTextField(
                      controller: provider.controllermember4name,
                      hintText: "Name",
                      iconData: Icons.nine_mp_outlined,
                      label: "Name",
                      validate: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return "*required";
                        }
                      },
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember4nic,
                      hintText: "NIC",
                      iconData: Icons.nine_mp_outlined,
                      label: "NIC",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                  CustomTextField(
                      controller: provider.controllermember4age,
                      hintText: "Age",
                      iconData: Icons.nine_mp_outlined,
                      label: "Age",
                      errorText: ""),
                  SizedBox(
                    height: AllDimensions.px10,
                  ),
                ],
              ),
            )),
      ];
  int _activeindex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<GusetRegistrationProvider>(builder: (context, provider, _) {
      // if (provider.snackbarmessage.isNotEmpty) {}
      return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.all(AllDimensions.px20),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  "Guest Registration Form",
                  style: GoogleFonts.poppins(
                    fontSize: AllDimensions.px25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.red,
                    backgroundColor: AppColors.cream,
                  ),
                ),
                // Text("Guest Registration Form",style: GoogleFonts.poppins(fontSize: AllDimensions.px25,fontWeight: FontWeight.bold,color: AppColors.red,backgroundColor: AppColors.cream,),),

                Form(
                  key: formkey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AllDimensions.px10, top: AllDimensions.px15),
                    child: Stepper(
                      type: StepperType.vertical,
                      elevation: AllDimensions.px10,
                      currentStep: _activeindex,
                      steps: stepList(GusetRegistrationProvider()),
                      onStepTapped: (value) {
                        formkey.currentState!.validate();
                        setState(() {
                          _activeindex = value;
                        });
                      },
                      onStepContinue: () {
                        formkey.currentState!.validate();

                        bool validdetails =
                            completedetails(GusetRegistrationProvider());
                        if (validdetails) {
                          _activeindex += 1;
                        }
                        // if (_activeindex ==
                        //     stepList(GusetRegistrationProvider()).length - 1) {
                        // } else if (_activeindex == 0) {
                        //   provider.validatestep1();
                        //   if (provider.step1) {
                        //     // debugPrint("Hi".toString());
                        //     // debugPrint(provider.validatestep1());
                        //     _activeindex += 1;
                        //     setState(() {});
                        //   } else {}
                        // }

                        // if (_activeindex <
                        //     stepList(GusetRegistrationProvider()).length - 1) {
                        //   _activeindex += 1;
                        // }
                        setState(() {});
                      },
                      onStepCancel: () {
                        if (_activeindex <= 0) {
                          _activeindex = 0;
                        } else {
                          _activeindex -= 1;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ),
                // Image.asset("Assets/Register/Guest Register/bottom.png",width: MediaQuery.of(context).size.width,)
              ]),
            ),
          ));
    });
  }

  bool completedetails(GusetRegistrationProvider provider) {
    if (_activeindex == 0) {
      if (provider.controllernewgsdivision.text.isEmpty ||
          provider.controllernewdivisionnumber.text.isEmpty ||
          provider.controlleroldgsdivision.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }
}
