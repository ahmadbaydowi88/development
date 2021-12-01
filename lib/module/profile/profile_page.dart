import 'dart:io';

import 'package:app_kelas_pintar/module/profile/change_profile.dart';
import 'package:app_kelas_pintar/theme.dart';
import 'package:app_kelas_pintar/widget/public.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        onTap: () => Navigator.pop(context),
        title: 'Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _bottonCamera(),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: 3,
                    clipBehavior: Clip.antiAlias,
                    itemBuilder: (BuildContext contex, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Container(
                          height: 196,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottonCamera() {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            final file = await Navigator.push<File>(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeProfile(),
              ),
            );
            setState(() {
              imageFile = file;
            });
          },
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greyColor,
              boxShadow: [
                shadowCard,
              ],
            ),
            child: (imageFile != null)
                ? Image.file(imageFile!)
                : Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: blackColor,
                    ),
                  ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                'John Doe',
                style: nunitoTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                'Kelas 10 IPA 8',
                style: nunitoTextStyle.copyWith(
                  fontSize: 12,
                  color: blackColor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
