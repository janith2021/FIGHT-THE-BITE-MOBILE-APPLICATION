// import 'package:flutter/cupertino.dart';
import 'package:client/const/all_imports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GuestRegister extends StatefulWidget {
  static String get routename => "/guest/register";

  const GuestRegister({Key? key}) : super(key: key);

  @override
  State<GuestRegister> createState() => _GuestRegisterState();
}

class _GuestRegisterState extends State<GuestRegister> {
  TextEditingController controllername = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllernewgsdivision = TextEditingController();
  TextEditingController controllernewdivisionnumber = TextEditingController();
  TextEditingController controllernewaddress = TextEditingController();
  TextEditingController controllernic = TextEditingController();
  TextEditingController controllercontact = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerconfirmpassword = TextEditingController();
  TextEditingController controlleroldgsdivision = TextEditingController();
  TextEditingController controlleroldgsdivisionnumber = TextEditingController();
  TextEditingController controlleroldaddress = TextEditingController();
  TextEditingController controllermember1name = TextEditingController();
  TextEditingController controllermember1nic = TextEditingController();
  TextEditingController controllermember1mobile = TextEditingController();
  TextEditingController controllermember1gender = TextEditingController();
  TextEditingController controllermember1age = TextEditingController();
  TextEditingController controllermember2name = TextEditingController();
  TextEditingController controllermember2age = TextEditingController();
  TextEditingController controllermember2nic = TextEditingController();
  TextEditingController controllermember2mobile = TextEditingController();
  TextEditingController controllermember2gender = TextEditingController();
  TextEditingController controllermember3name = TextEditingController();
  TextEditingController controllermember3age = TextEditingController();
  TextEditingController controllermember3nic = TextEditingController();
  TextEditingController controllermember3mobile = TextEditingController();
  TextEditingController controllermember3gender = TextEditingController();
  TextEditingController controllermember4name = TextEditingController();
  TextEditingController controllermember4age = TextEditingController();
  TextEditingController controllermember4nic = TextEditingController();
  TextEditingController controllermember4mobile = TextEditingController();
  TextEditingController controllermember4gender = TextEditingController();
  TextEditingController controllerage = TextEditingController();
  TextEditingController controllergender = TextEditingController();
  TextEditingController controllermobile = TextEditingController();
  // TextEditingController controllerpassword = TextEditingController();

  int currentStep = 0;
  bool isCompleted = false;
  final formKey = GlobalKey<FormState>();

  final List<String> items = ['Male', 'Female'];
  String? selctedvalue1;
  String? selectedvalue2;
  String? selectedvalue3;
  String? selectedvalue4;
  String? selectedvalue5;
  String? selectedvalue6;
  String? selectedvalue7;

  guestregistration() async {
    var body = {
      "email": controlleremail.text,
      "address": controllernewaddress.text,
      "password": controllerpassword.text,
      "contact": controllermobile.text,
      "GuestVillager": [
        {
          "name": controllername.text,
          "nic": controllernic.text,
          "gender": controllergender.text,
          "age": controllerage.text,
          "address": controllernewaddress.text
        }
      ],
      "members": [
        {
          "name": controllermember1name.text,
          "nic": controllermember1nic.text,
          "gender": controllermember1gender.text,
          "age": controllermember1age.text,
        },
        {
          "name": controllermember2name.text,
          "nic": controllermember2nic.text,
          "gender": controllermember2gender.text,
          "age": controllermember2age.text,
        },
        {
          "name": controllermember3name.text,
          "nic": controllermember3nic.text,
          "gender": controllermember3gender.text,
          "age": controllermember3age.text,
        },
        {
          "name": controllermember4name.text,
          "nic": controllermember4nic.text,
          "gender": controllermember4gender.text,
          "age": controllermember4age.text,
        }
      ],
      "newgsDivision": controllernewgsdivision.text,
      "oldgsDivision": controlleroldgsdivision.text,
      "newdivisionnumber": controllernewdivisionnumber.text,
      "role": "Guest",
    };
    var fullurl = "${AllStrings.baseurl}/guest/register";
    debugPrint(fullurl);
    // debugPrint(body.toString());
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};
    var result = await http.post(Uri.parse(fullurl),
        body: jsonEncode(body), headers: setHeaders());
    var response = await jsonDecode(result.body);
    debugPrint(response.toString());
    if (response['type'] == "success") {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/login");
      // ignore: use_build_context_synchronously
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.success,
              title: "Success",
              text: response['message']));
    }else{
       // ignore: use_build_context_synchronously
       ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.danger,
              title: "Error",
              text: response['message']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        title: Text(
          "Guest User Registration",
          style: GoogleFonts.poppins(
              fontSize: AllDimensions.px20,
              color: AppColors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: formKey,
        child: Stepper(
          steps: getSteps(),
          type: StepperType.vertical,
          currentStep: currentStep,
          // onStepTapped: (step) {
          //   // debugPrint(step.toString());
          //   formKey.currentState!.validate();
          //   setState(() {
          //     currentStep = step;
          //   });
          // },
          onStepContinue: () {
            // final isLastStep = currentStep == getSteps().length - 1;
            formKey.currentState!.validate();
            bool isDetailValid = fulldetails();
            debugPrint(isDetailValid.toString());
            if (isDetailValid.toString() == "true") {
              // debugPrint("Hello");
              if (currentStep >= 0 && currentStep < getSteps().length - 1) {
                debugPrint(currentStep.toString());
                setState(() {
                  currentStep += 1;
                });
              } else {
                debugPrint("hello");
                guestregistration();
              }
            }
          },
          onStepCancel: () {
            // debugPrint(currentStep.toString());
            if (currentStep == 0) {
              null;
            } else {
              setState(() {
                currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }

  bool fulldetails() {
    if (currentStep == 0) {
      if (controllernewgsdivision.text.isEmpty ||
          controlleroldgsdivision.text.isEmpty ||
          controllernewdivisionnumber.text.isEmpty) {
        // debugPrint("Hi");
        return false;
      } else {
        return true;
      }
    } else if (currentStep == 1) {
      if (controllername.text.isEmpty ||
          // controlleremail.text.isEmpty ||
          controllernic.text.isEmpty ||
          controllerage.text.isEmpty ||
          controlleremail.text.isEmpty ||
          controllermobile.text.isEmpty ||
          controllernewaddress.text.isEmpty ||
          controllerpassword.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (currentStep == 2) {
      if (controllermember1name.text.isEmpty ||
          controllermember1nic.text.isEmpty ||
          controllermember1gender.text.isEmpty ||
          controllermember1age.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (currentStep == 3) {
      if (controllermember2name.text.isEmpty ||
          controllermember2nic.text.isEmpty ||
          controllermember2gender.text.isEmpty ||
          controllermember2age.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (currentStep == 4) {
      if (controllermember3name.text.isEmpty ||
          controllermember3nic.text.isEmpty ||
          controllermember3gender.text.isEmpty ||
          controllermember3age.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (currentStep == 5) {
      if (controllermember4name.text.isEmpty ||
          controllermember4nic.text.isEmpty ||
          controllermember4gender.text.isEmpty ||
          controllermember4age.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  List<Step> getSteps() => [
        Step(
            title: const Text("Grama Niladhari Division Details"),
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "New Grama Niladhari Division Name",
                      prefixIcon: Icon(Icons.home)),
                  controller: controllernewgsdivision,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "New Grama Niladhari Division is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Grama Niladhari Division Number",
                      prefixIcon: Icon(Icons.home)),
                  controller: controllernewdivisionnumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "New Grama Niladhari Division Number is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Old Grama Niladhari Division Number",
                      prefixIcon: Icon(Icons.home)),
                  controller: controlleroldgsdivision,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Old Grama Niladhari Division Number is Required.";
                    }
                    return null;
                  },
                ),
              ],
            )),
        Step(
            title: const Text("Guest Villager Details"),
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  controller: controllername,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllernic,
                  decoration: const InputDecoration(labelText: "NIC"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "NIC is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllergender,
                  decoration: const InputDecoration(labelText: "Gender"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Gender is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllerage,
                  decoration: const InputDecoration(labelText: "Age"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Age is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermobile,
                  decoration: const InputDecoration(labelText: "Mobile Number"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mobile Number is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllernewaddress,
                  decoration: const InputDecoration(labelText: "Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Address is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controlleremail,
                  decoration: const InputDecoration(labelText: "E-mail"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllerpassword,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is Required";
                    }
                    return null;
                  },
                ),
              ],
            )),
        Step(
            title: const Text("Family Member 1 Details"),
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  controller: controllermember1name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember1nic,
                  decoration: const InputDecoration(labelText: "NIC"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "NIC is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember1gender,
                  decoration: const InputDecoration(labelText: "Gender"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Gender is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember1age,
                  decoration: const InputDecoration(labelText: "Age"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Age is Required";
                    }
                    return null;
                  },
                ),
              ],
            )),
        Step(
            title: const Text("Family Member 2 Details"),
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3,
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  controller: controllermember2name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember2nic,
                  decoration: const InputDecoration(labelText: "NIC"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "NIC is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember2gender,
                  decoration: const InputDecoration(labelText: "Gender"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Gender is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember2age,
                  decoration: const InputDecoration(labelText: "Age"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Age is Required";
                    }
                    return null;
                  },
                ),
              ],
            )),
        Step(
            title: const Text("Family Member 3 Details"),
            state: currentStep > 4 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 4,
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  controller: controllermember3name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember3nic,
                  decoration: const InputDecoration(labelText: "NIC"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "NIC is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember3gender,
                  decoration: const InputDecoration(labelText: "Gender"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Gender is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember3age,
                  decoration: const InputDecoration(labelText: "Age"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Age is Required";
                    }
                    return null;
                  },
                ),
              ],
            )),
        Step(
            title: const Text("Family Member 4 Details"),
            state: currentStep > 5 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 5,
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  controller: controllermember4name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember4nic,
                  decoration: const InputDecoration(labelText: "NIC"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "NIC is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember4gender,
                  decoration: const InputDecoration(labelText: "Gender"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Gender is Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllermember4age,
                  decoration: const InputDecoration(labelText: "Age"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Age is Required";
                    }
                    return null;
                  },
                ),
              ],
            )),
      ];
}
