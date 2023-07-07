import 'dart:convert';

import 'package:client/screen/officer/Grama_Niladhari/grama_niladhari_dashboard.dart';
import 'package:client/screen/officer/PHI/phi_dashboard.dart';
import 'package:client/screen/user/user_dashboard.dart';
import 'package:hive/hive.dart';

import '../const/all_imports.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:http/http.dart' as http;

class Splash extends StatefulWidget {
  static String get routename => "/splash";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Box? _users;
  String? _user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      openBox();
    });
  }

  openBox() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await Hive.openBox('users');
    setState(() {
      _users = Hive.box('users');
      _user = _users!.get('user');
    });

    // debugPrint(_user);
  }

  Future getuser() async {
    debugPrint('hi');
    debugPrint(_user);
    var data = {'email': _user};
    var fullurl = "${AllStrings.baseurl}/user";
    setHeaders() =>
        {'Content-Type': 'application/json', 'Accept': 'application/json'};
    var response = await http.post(Uri.parse(fullurl),
        body: jsonEncode(data), headers: setHeaders());
    var body = await jsonDecode(response.body);
    //  debugPrint(body['user']);
    if (body['type'].toString() == 'success') {
      var user = body['user'].toString();
    
      return user;
    } else {
      // ignore: use_build_context_synchronously
      return 'login';
      // Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.amber,
      duration: const Duration(seconds: 10),
      animationDuration: const Duration(seconds: 5),
      childWidget: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset('Assets/logo.png'),
      ),
      defaultNextScreen: const Login()
      // FutureBuilder(
      //     future: getuser(),
      //     builder: (BuildContext context, AsyncSnapshot snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const CircularProgressIndicator(
      //           backgroundColor: Colors.red,
      //         );
      //       } else {
      //         if (snapshot.hasError) {
      //           return Text(snapshot.error.toString());
      //         } else {
      //           if (snapshot.data == 'user') {
      //             // Navigator.pushReplacementNamed(context, "/user/dashboard");
      //             return const UserDashboard();
      //             // return const Login();
      //           } else if (snapshot.data == 'Grama Niladhari') {
      //              return const GramaNiladhariDashBoard();
      //             // return const Login();
      //           } else if (snapshot.data == 'PHI') {
      //             return const PHIDashBoard();
      //           }
      //           // }else if(snapshot.data.toString() == '')
      //           return const Login();
      //         }
      //       }
      //     }),
    );
  }
}
