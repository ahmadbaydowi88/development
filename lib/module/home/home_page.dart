import 'package:app_kelas_pintar/theme.dart';
import 'package:app_kelas_pintar/widget/public.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'Home Page',
          style: nunitoTextStyle,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              'Welcome',
              style: nunitoTextStyle.copyWith(color: blackColor, fontSize: 28),
            ),
          ),
          bottonAction(
            title: 'Pengecekan bilangan cacah',
            style: nunitoTextStyle.copyWith(fontSize: 18),
            onTap: () {},
          ),
          SizedBox(
            height: 16,
          ),
          bottonAction(
            title: 'Kalkulator nilai siswa',
            style: nunitoTextStyle.copyWith(fontSize: 18),
            onTap: () {
              Navigator.pushNamed(context, '/calculator');
            },
          ),
          SizedBox(
            height: 16,
          ),
          bottonAction(
            title: 'Profil pengguna',
            style: nunitoTextStyle.copyWith(fontSize: 18),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
    );
  }
}
