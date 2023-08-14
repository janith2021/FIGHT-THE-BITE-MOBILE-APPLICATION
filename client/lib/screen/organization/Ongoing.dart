<<<<<<< HEAD
import 'package:flutter/material.dart';

class CardWithButtonsPage extends StatelessWidget {
  const CardWithButtonsPage({super.key});
  static String get routename => "/Ongoing";
=======
import 'package:client/const/all_imports.dart';

class MyApp extends StatelessWidget {
  static String get routename => "/organization/inform/ongoing";


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CardWithButtonsPage(),
    );
  }
}

class CardWithButtonsPage extends StatelessWidget {
  const CardWithButtonsPage({super.key});
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
=======
      resizeToAvoidBottomInset: false,
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
      appBar: AppBar(
        title: const Text('Ongoing Campaigns'),
        backgroundColor: Colors.red,
        centerTitle: true,
<<<<<<< HEAD
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: CustomCard(),
            ),
            SizedBox(height: 16.0),
            ButtonRow(),
          ],
        ),
      ),
=======
        leading: Container(
          width: 60, // Adjust the width as needed
          height: 60, // Adjust the height as needed
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle the back button action here
              Navigator.pop(
                  context); // Navigate back when the button is pressed
            },
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70.0), // Adjusted gap here
          CustomCard(),
          SizedBox(height: 60.0),
          ButtonRow(),
        ],
      ),
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      shadowColor: Colors.red,
      color: Colors.redAccent[50],
      child: Padding(
<<<<<<< HEAD
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Campaign Details',
              style: TextStyle(
                fontSize: 20,
=======
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Text(
              'Campaign Details',
              style: TextStyle(
                fontSize: 22,
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
                color: Colors.red[900],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Campaign Name',
                  focusColor: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Date',
                  focusColor: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Sponsorship Details',
                  focusColor: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Status',
                  focusColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 25.0),
        ElevatedButton(
          onPressed: () {
            // Handle the first button's onPressed event
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
<<<<<<< HEAD
          ),
          child: const Text('Update'),
        ),
        const SizedBox(width: 25.0),
=======
            fixedSize: MaterialStateProperty.all(
                Size(120, 50)), // Adjust width and height as needed
          ),
          child: const Text(
            'Update',
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
            ),
          ),
        ),
        const SizedBox(width: 85.0),
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
        ElevatedButton(
          onPressed: () {
            // Handle the second button's onPressed event
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
<<<<<<< HEAD
          ),
          child: const Text('Delete'),
=======
            fixedSize: MaterialStateProperty.all(Size(120, 50)),
          ),
          child: const Text(
            'Delete',
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
            ),
          ),
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
        ),
      ],
    );
  }
}
<<<<<<< HEAD

void main() {
  runApp(MaterialApp(
    home: CardWithButtonsPage(),
  ));
}
=======
>>>>>>> 29500b2f744550f49be6099e39e7989fc8394b16
