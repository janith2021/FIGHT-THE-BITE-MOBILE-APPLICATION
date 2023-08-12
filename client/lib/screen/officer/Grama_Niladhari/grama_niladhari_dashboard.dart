<<<<<<< HEAD
=======
// import 'package:hive/hive.dart';
>>>>>>> 0bc2f4106f552948dcb7808a20da2b7ec718a5f5

import '../../../const/all_imports.dart';

class GramaNiladhariDashBoard extends StatefulWidget {
  static String get routename => "/officer/gramaniladhari/dashboard";
  const GramaNiladhariDashBoard({super.key});

  @override
  State<GramaNiladhariDashBoard> createState() =>
      _GramaNiladhariDashBoardState();
}

class _GramaNiladhariDashBoardState extends State<GramaNiladhariDashBoard> {
  Box? _userbox;
  String? _user;

  @override
  void initState() {

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
<<<<<<< HEAD

=======
>>>>>>> 0bc2f4106f552948dcb7808a20da2b7ec718a5f5
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('Grama Niladhari Dashboard',style: TextStyle(color: AppColors.green)),
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
