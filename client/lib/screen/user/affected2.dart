import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class AffectPerson extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SymptomCheckScreen(),
//     );
//   }
// }

class SymptomCheckScreen extends StatefulWidget {
  static String get routename => "/villager/inform/affected2";
  @override
  _SymptomCheckScreenState createState() => _SymptomCheckScreenState();
}

class _SymptomCheckScreenState extends State<SymptomCheckScreen> {
  // List of affected persons
  List<String> affectedPersons = [
    'Nimali Wasana',
    'Kamali Perera',
    'Ushani Dilini',
    'Jagath Perera',
    'Nayomi Lakshi',
  ];

  // List of symptoms
  List<String> symptoms = [
    'Fever',
    'Headache',
    'Joint Pain',
    'Nausea',
    'Vomiting',
  ];

  // Map to store selected symptoms for each person
  Map<String, Set<String>> personSymptoms = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Add your logic here for back button
          },
        ),
        title: Text(
          'Symptom Check',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // List of affected persons
            Expanded(
              child: ListView.builder(
                itemCount: affectedPersons.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          BorderSide(color: Colors.red, width: 2), // Red border
                    ),
                    child: ListTile(
                      title: Text(
                        affectedPersons[index],
                        style: GoogleFonts.poppins(),
                      ),
                      onTap: () {
                        _showSymptomDialog(context, index);
                      },
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Adjusted spacing between last card and button
            SizedBox(height: 100), // Adjust the value as needed

            // Next button
            ElevatedButton(
              onPressed: () {
                // Add your logic here for the 'Next' button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show symptom selection dialog
  void _showSymptomDialog(BuildContext context, int personIndex) {
    Set<String> selectedSymptoms =
        personSymptoms[affectedPersons[personIndex]] ?? {};

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'Symptoms for ${affectedPersons[personIndex]}',
            style: GoogleFonts.poppins(),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: symptoms.map((symptom) {
              return CheckboxListTile(
                title: Text(
                  symptom,
                  style: GoogleFonts.poppins(),
                ),
                value: selectedSymptoms.contains(symptom),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      setState(() {
                        selectedSymptoms.add(symptom);
                        value = false;
                      });
                    } else {
                      setState(() {
                        selectedSymptoms.remove(symptom);
                        value = true;
                      });
                    }
                    
                    personSymptoms[affectedPersons[personIndex]] =
                        selectedSymptoms;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                tileColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                checkColor: Colors.white,
                activeColor: Colors.red,
              );
            }).toList(),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
