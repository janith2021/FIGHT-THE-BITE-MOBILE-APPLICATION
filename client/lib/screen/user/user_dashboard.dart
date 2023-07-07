import 'package:hive/hive.dart';

import '../../const/all_imports.dart';

class UserDashboard extends StatefulWidget {
  static String get routename => "/user/dashboard";
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  Box? _users;
  String? _currentuser;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  openBox() async {
    await Hive.openBox('users');
    setState(() {
      _users = Hive.box('users');
      _currentuser = _users!.get('user');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Text('USER DASHBOARD'),_currentuser != null ? Text(_currentuser!):const CircularProgressIndicator()],
        ),
      ),
    );
  }
}
