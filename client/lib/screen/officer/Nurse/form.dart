import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200.0,
                width: 700.0,
                child: RedRoundedCard(
                  profileImage: 'assets/profile_picture.png',
                  name: 'Chathura Munasinghe',
                  age: '25 Years | Male',
                ),
              ),
              const SizedBox(height: 40.0),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 80.0,
                        child: SmallColoredCard(
                          color: Color.fromARGB(255, 156, 191, 205),
                          text: 'Body Weight',
                        ),
                      ),
                      SizedBox(
                        height: 80.0,
                        child: SmallColoredCard(
                          color: Color.fromARGB(255, 201, 138, 159),
                          text: 'Body Height',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Patient Monitoring - 10/08/2023',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Form(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'HTC',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Input (ml) Oral /IV',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'HR / MIN',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'BP/ mmHg',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Pulse Pressure',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'CRFT <25/> 25',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Extremity Warm / Cold',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'RR',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'UOP / day void /catheter',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'UOP ml / kg / hr',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Platelet Count',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  CheckupSection(),
                                  const SizedBox(height: 16.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Time',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20.0),
                              child: Center(
                                child: SizedBox(
                                  height: 50.0,
                                  width: 300.0,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckupSection extends StatefulWidget {
  const CheckupSection({super.key});

  @override
  _CheckupSectionState createState() => _CheckupSectionState();
}

class _CheckupSectionState extends State<CheckupSection> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Text('Finished Checkup'),
          ],
        ),
        if (isChecked)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(),
              ),
            ),
          ),
      ],
    );
  }
}

class RedRoundedCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String age;

  const RedRoundedCard({
    super.key,
    required this.profileImage,
    required this.name,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImage),
              radius: 40.0,
            ),
            const SizedBox(height: 12.0),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age: $age',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallColoredCard extends StatelessWidget {
  final Color color;
  final String text;

  const SmallColoredCard({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
