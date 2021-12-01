import 'package:app_kelas_pintar/module/calculator_nilai/calculator_nilai.dart';
import 'package:app_kelas_pintar/module/home/home_page.dart';
import 'package:app_kelas_pintar/module/profile/change_profile.dart';
import 'package:app_kelas_pintar/module/profile/profile_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/changeProfile': (context) => ChangeProfile(),
        '/calculator': (context) => Calculator(),
      },
    );
  }
}
