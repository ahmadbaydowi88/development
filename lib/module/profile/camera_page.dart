import 'dart:io';

import 'package:app_kelas_pintar/theme.dart';
import 'package:app_kelas_pintar/widget/public.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;

  Future<void> initializeCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller!.initialize();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  Future<File?> takePicture() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = '${root.path}/Guided_Camera';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/${DateTime.now()}.jpg';

    try {
      XFile picture = await controller!.takePicture();
      picture.saveTo(filePath);

      // print(picture);
    } catch (e) {
      return null;
    }
    return File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'Ambil Foto'),
      body: FutureBuilder(
        future: initializeCamera(),
        builder: (_, snapshot) =>
            (snapshot.connectionState == ConnectionState.done)
                ? Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CameraPreview(
                            controller!,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 37,
                        child: GestureDetector(
                          onTap: () async {
                            if (!controller!.value.isTakingPicture) {
                              File? result = await takePicture();
                              File? croppedImage = await ImageCropper.cropImage(
                                sourcePath: result!.path,
                                aspectRatioPresets: [
                                  CropAspectRatioPreset.original
                                ],
                                maxWidth: 512,
                                maxHeight: 512,
                              );
                              print('File : ' + croppedImage!.path);
                              Navigator.pop(context, croppedImage);
                            }
                          },
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: whiteColor),
                          ),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ),
      ),
    );
  }
}
