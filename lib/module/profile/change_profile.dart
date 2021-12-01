import 'dart:io';

import 'package:app_kelas_pintar/module/profile/camera_page.dart';
import 'package:app_kelas_pintar/theme.dart';
import 'package:app_kelas_pintar/widget/public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

BaseOptions options = new BaseOptions(
  connectTimeout: 30000,
  receiveTimeout: 30000,
);
Dio dio = new Dio(options);

class _ChangeProfileState extends State<ChangeProfile> {
  File? imageFile;
  bool isImage = false;
  String api_host = 'http://staging-satrio.kelaspintar.co.id:4444/api';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, onTap: () {
        print("object");
      }, title: 'Ambil Foto'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 343,
            width: 343,
            margin: EdgeInsets.only(
              top: 16,
              left: 15,
              right: 17,
              bottom: 34,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                shadowCard,
              ],
            ),
            child: isImage
                ? Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  )
                : SizedBox(),
          ),
          bottonAction(
            title: "Ambil Dari kamera",
            style: nunitoTextStyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
            ),
            onTap: () async {
              imageFile = await Navigator.push<File>(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraPage(),
                ),
              );
              print("Image File: " + imageFile!.path);
              setState(() {
                isImage = true;
              });
            },
          ),
          SizedBox(
            height: 16,
          ),
          bottonAction(
              title: "Ambil dari Gallery",
              style: nunitoTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
              onTap: () {})
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          uploadImage(imageFile!);
          print("file :" + imageFile!.path);
          Navigator.pop(context, imageFile);
        },
        child: Container(
          height: 44,
          color: (imageFile != null) ? primaryColor : greyColor,
          child: Center(
            child: Text(
              'Simpan',
              style: nunitoTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 12,
                color: (imageFile != null) ? whiteColor : Color(0xFF757575),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage(
    File file, {
    Map<String, String>? header,
    onComplete(String data, int statusCode)?,
    onError(DioError error)?,
  }) async {
    if (header == null) header = {};
    header.addAll({
      "Authorization":
          "wTPb3I47TnooWoJijkUw65YIhp72X3YrE5fA+c27mZcJzEka6Uxp2jTV3qMabKESnxpFnARAWFE8NN79qcf3Dw==",
    });
    String fileName = file.path;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    try {
      Response response = await dio.post(api_host,
          data: formData, options: Options(headers: header));
      onComplete!(response.data, response.statusCode!);
    } on DioError catch (e) {
      if (onError != null) onError(e);
    }
  }

  Widget emptyImage() {
    return Container(
      height: 343,
      margin: EdgeInsets.only(
        top: 16,
        left: 15,
        right: 17,
        bottom: 34,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: greyColor,
        boxShadow: [
          shadowCard,
        ],
      ),
    );
  }
}
