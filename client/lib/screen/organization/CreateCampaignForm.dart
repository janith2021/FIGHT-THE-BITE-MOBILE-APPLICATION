import 'package:date_only_field/date_only_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../const/all_imports.dart';
import '../../providers/create_campaign_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForms(),
    );
  }
}

class MyForms extends StatefulWidget {
  static String get routename => "/organization/create/form";
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForms> {
  final _formKey = GlobalKey<FormState>();
  // TextEditingController _nameController = TextEditingController();
  // TextEditingController _dateController = TextEditingController();
  // TextEditingController _locationController = TextEditingController();
  // bool _sponsorship = false;
  // TextEditingController _amountController = TextEditingController();
  String _budgetReport = '';
  bool _agreedToGuidelines = false;

  @override
  // void dispose() {
  //   _nameController.dispose();
  //   _dateController.dispose();
  //   _locationController.dispose();
  //   _amountController.dispose();
  //   super.dispose();
  // }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     // Form is valid, handle form submission
  //     String name = _nameController.text;
  //     String date = _dateController.text;
  //     String location = _locationController.text;
  //     bool sponsorship = _sponsorship;
  //     String amount = _amountController.text;
  //     // Handle uploaded files (budget report) here

  //     print('Name: $name');
  //     print('Date: $date');
  //     print('Location: $location');
  //     print('Sponsorship: $sponsorship');
  //     if (sponsorship) {
  //       print('Expected Amount: $amount');
  //     }
  //     print('Budget Report: $_budgetReport');
  //     print('Agreed to Guidelines: $_agreedToGuidelines');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateCampaignProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'ADD CAMPAIGN',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      height:
                          20), // Increase the gap between app bar and text fields
                  TextFormField(
                    controller: provider.campaignnamecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter campaign name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Campaign Title',
                      labelStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.campaigndatecontroller.text.isEmpty
                              ? Colors.red
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: provider.campaigndatecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter campaign date';
                      }
                      // You can add additional date validation logic here
                      return null;
                    },
                    decoration: InputDecoration(
                      // icon: const Icon(Icons.calendar_today),
                      labelText: 'Date',
                      labelStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.campaigndatecontroller.text.isEmpty
                              ? Colors.red
                              : Colors.red,
                        ),
                      ),
                    ),
                    onTap: () async {
                      provider.getDivision(context);
                      DateTime? dateTime = await showOmniDateTimePicker(
                        context: context,
                        initialDate:
                            DateTime.now().add(const Duration(days: 7)),
                        firstDate: DateTime.now().add(const Duration(days: 7)),
                        lastDate: DateTime.now().add(
                          const Duration(days: 3652),
                        ),
                        is24HourMode: true,
                        isShowSeconds: false,
                        minutesInterval: 1,
                        secondsInterval: 1,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        constraints: const BoxConstraints(
                          maxWidth: 350,
                          maxHeight: 650,
                        ),
                        transitionBuilder: (context, anim1, anim2, child) {
                          return FadeTransition(
                            opacity: anim1.drive(
                              Tween(
                                begin: 0,
                                end: 1,
                              ),
                            ),
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 200),
                        barrierDismissible: true,
                        selectableDayPredicate: (dateTime) {
                          // Disable 25th Feb 2023
                          if (dateTime == DateTime(2023, 2, 25)) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                      );
                      var dattimeconvert = dateTime.toString();
                      var datetimelist = dattimeconvert.split(" ").toList();
                      // debugPrint(datetimelist);
                      if (datetimelist.isNotEmpty && datetimelist[0].toString() != null && datetimelist[1].toString() != null) {
                        // var pickdate = DateTime(
                        //     pickedDate.year, pickedDate.month, pickedDate.day);
                        // String formatdate =
                        //     DateFormat('M/d/y').format(pickdate);
                        // debugPrint(formatdate);
                        setState(() {
                          provider.campaigndatecontroller.text =
                              datetimelist[0];
                          provider.campaigntimecontroller.text = datetimelist[1]
                              .split(":00.")
                              .toList()
                              .elementAt(0);
                          datetimelist.clear();
                        });
                      }

                      // debugPrint(Date.fromDateTime(pickedDate).toString());
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: true,
                    // enabled: false,
                    controller: provider.campaigntimecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter campaign time';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Start Time',
                      labelStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.campaigndatecontroller.text.isEmpty
                              ? Colors.red
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AllDimensions.px15,
                  ),
                  TextFormField(
                    controller: provider.campaignlocationcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter campaign location';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Venue',
                      labelStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              provider.campaignlocationcontroller.text.isEmpty
                                  ? Colors.red
                                  : Colors.red,
                        ),
                      ),
                    ),
                  ),

                  // Row(
                  // children: [
                  //   Checkbox(
                  //     value: _agreedToGuidelines,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _agreedToGuidelines = value!;
                  //       });
                  //     },
                  //     activeColor: Colors.red,
                  //   ),
                  //   SizedBox(height: AllDimensions.px100,),
                  //   // Expanded(
                  //   //   child: Text(
                  //   //     'I have read and agree to the guidelines',
                  //   //     style: GoogleFonts.poppins(fontSize: 17),
                  //   //   ),
                  //   // ),
                  // ],
                  // ),
                  const SizedBox(height: 32),
                  Center(
                    // Center the button
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          provider.submitform(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        minimumSize: MaterialStateProperty.all(const Size(
                            300, 50)), // Increase the width and height
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // Add border radius
                          ),
                        ),
                      ),
                      child: Text(
                        'Create',
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
