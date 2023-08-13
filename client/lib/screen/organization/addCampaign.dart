import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  bool _sponsorship = false;
  TextEditingController _amountController = TextEditingController();
  String _budgetReport = '';
  bool _agreedToGuidelines = false;

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, handle form submission
      String name = _nameController.text;
      String date = _dateController.text;
      String location = _locationController.text;
      bool sponsorship = _sponsorship;
      String amount = _amountController.text;
      // Handle uploaded files (budget report) here

      print('Name: $name');
      print('Date: $date');
      print('Location: $location');
      print('Sponsorship: $sponsorship');
      if (sponsorship) {
        print('Expected Amount: $amount');
      }
      print('Budget Report: $_budgetReport');
      print('Agreed to Guidelines: $_agreedToGuidelines');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADD CAMPAIGN',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height:
                      20), // Increase the gap between app bar and text fields
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter campaign name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Campaign Name',
                  labelStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _nameController.text.isEmpty
                          ? Colors.red
                          : Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter campaign date';
                  }
                  // You can add additional date validation logic here
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Campaign Date',
                  labelStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _dateController.text.isEmpty
                          ? Colors.red
                          : Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter campaign location';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _locationController.text.isEmpty
                          ? Colors.red
                          : Colors.red,
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Checkbox(
                    value: _agreedToGuidelines,
                    onChanged: (value) {
                      setState(() {
                        _agreedToGuidelines = value!;
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text(
                    'I have read and agree to the guidelines',
                    style: GoogleFonts.poppins(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Center(
                // Center the button
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(
                        Size(300, 50)), // Increase the width and height
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25.0), // Add border radius
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
    );
  }
}
