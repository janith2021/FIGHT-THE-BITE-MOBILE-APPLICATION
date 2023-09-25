import 'package:flutter/material.dart';

class PhiNotification extends StatelessWidget {
  static String get routeName => "phi/notification";
  const PhiNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Notification"),
      ),
    );
  }
}