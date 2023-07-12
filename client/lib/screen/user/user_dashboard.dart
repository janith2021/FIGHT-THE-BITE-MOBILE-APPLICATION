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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              CustomCarousel(autoplay: true, durationInSeconds: 1, items: [
                Image.asset(
                "Assets/login1.png",
              ),
              Image.asset(
                "Assets/login2.png",
              ),
              Image.asset(
                "Assets/login3.png",
              ),
              Image.asset(
                "Assets/login4.png",
              ),
              Image.asset(
                "Assets/login5.png",
              )
              ]),
              ListTile(
                title: Text('Hello'),
                tileColor: Colors.amber,
                leading: Text('HI'),
                shape: Border.all(width: AllDimensions.px10, style: BorderStyle.solid),
                trailing: Text('Janith'),
              )
            ],
          ),
        ),
      )
    );
  }
}
