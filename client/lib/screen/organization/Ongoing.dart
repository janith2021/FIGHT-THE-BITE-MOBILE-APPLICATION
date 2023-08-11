import 'package:flutter/material.dart';

class CardWithButtonsPage extends StatelessWidget {
  const CardWithButtonsPage({super.key});
  static String get routename => "/Ongoing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongoing Campaigns'),
        backgroundColor: Colors.red,
        centerTitle: true,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Campaign Details',
              style: TextStyle(
                fontSize: 20,
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
          ),
          child: const Text('Update'),
        ),
        const SizedBox(width: 25.0),
        ElevatedButton(
          onPressed: () {
            // Handle the second button's onPressed event
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CardWithButtonsPage(),
  ));
}
