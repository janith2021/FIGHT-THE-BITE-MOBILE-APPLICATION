
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
            const Text('Grama Niladhari Dashboard'),
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
