import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  static String get routename => "/addCampaign";
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
        title: Text('ADD CAMPAIGN'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                  focusColor: Colors.red,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
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
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
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
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Do you expect a sponsorship?'),
                  Radio(
                    value: true,
                    groupValue: _sponsorship,
                    onChanged: (value) {
                      setState(() {
                        _sponsorship = value as bool;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _agreedToGuidelines,
                    onChanged: (value) {
                      setState(() {
                        _agreedToGuidelines = value!;
                      });
                    },
                  ),
                  Text('I have read and agree to the guidelines'),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
