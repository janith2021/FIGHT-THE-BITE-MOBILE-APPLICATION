import 'package:hive/hive.dart';

import '../../../const/all_imports.dart';

class PHIDashBoard extends StatefulWidget {
  static String get routename => "/officer/phi/dashboard";
  const PHIDashBoard({super.key});

  @override
  State<PHIDashBoard> createState() =>
      _PHIDashBoardState();
}

class _PHIDashBoardState extends State<PHIDashBoard> {

  Box? _userbox;
  String? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openBox();
  }

  openBox() async {
    await Hive.openBox('users');
    setState(() {
      _userbox = Hive.box('users');
      _user = _userbox!.get('user');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('PHI Dashboard'),
            _user != null
                ? Text(_user!)
                : CircularProgressIndicator(
                    backgroundColor: AppColors.red,
                  )
          ],
        ),
      ),
    );
  }
}
