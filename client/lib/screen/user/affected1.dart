import 'package:client/const/all_dimensions.dart';
import 'package:client/const/all_imports.dart';
import 'package:flutter/material.dart';

// class Affect extends StatelessWidget {
//   static String get routename => "/villager/inform/affected1";
//   @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     home: SelectionScreen(),
//   //   );
//   // }
// };

class SelectionScreen extends StatefulWidget {
  static String get routename => "/villager/inform/affected1";
  const SelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<String> affectedPersons = [
    'Nimali Wasana',
    'Kamali Perera',
    'Ushani dilini',
    'Jagath Perera',
    'Nayomi Lakshi',
  ];

  List<bool> selectedPersons = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Select the person who is affected:',
                  style: GoogleFonts.poppins(fontSize: AllDimensions.px20,fontWeight: FontWeight.bold,),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(affectedPersons.length, (index) {
                    return Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.red,
                          ),
                          child: Checkbox(
                            value: selectedPersons[index],
                            onChanged: (value) {
                              setState(() {
                                selectedPersons[index] = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          affectedPersons[index],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/villager/inform/affected2");
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.5, AllDimensions.px20),
                    backgroundColor: Colors.red,
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 110, vertical: 12),
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
              ),
              SizedBox(height: 40),
              // Expanded(
              //   child: Image.asset(
              //     'Assets/villagers/inform/symptoms.png',
              //     width: MediaQuery.of(context).size.width, // Set the desired width
              //     height: 1000,
              //   ),
              // ),
              Expanded(
                child: Image.asset(
                    'Assets/villagers/inform/symptoms.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height, // Set the desired width
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
