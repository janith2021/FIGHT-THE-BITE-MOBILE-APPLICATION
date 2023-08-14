import 'package:flutter/material.dart';

class Affect extends StatelessWidget {
  static String get routename => "/villager/inform/affected1";
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(
=======
    return MaterialApp(
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
      home: SelectionScreen(),
    );
  }
}

class SelectionScreen extends StatefulWidget {
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
<<<<<<< HEAD
=======

>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
  List<bool> selectedPersons = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
=======
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(70.0),
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Select the person who is affected:',
                  style: TextStyle(
<<<<<<< HEAD
                    fontSize: 22,
=======
                    fontSize: 25,
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
                    fontWeight: FontWeight.bold,
                  ),
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
<<<<<<< HEAD
                          style: const TextStyle(
=======
                          style: TextStyle(
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
                            fontSize: 20,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, "/villager/inform/affected2");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 110, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
=======
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/villager/inform/affected2");
                    
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 110, vertical: 12),
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
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
              Expanded(
                child: Image.asset(
                  'assets/symptoms.png',
                  width: 1500, // Set the desired width
                  height: 1000,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
