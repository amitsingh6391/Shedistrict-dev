import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';
import 'package:shedistrict/stores/user_store.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';

import '../../../storage.dart';

class DevicePermissionForVideos extends ConsumerWidget {
  DevicePermissionForVideos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final signupWatcher = watch(signUpProvider);
    ImagePicker picker = ImagePicker();
    Storage storage = Storage();
    UserStore userStore = UserStore();

    Future<void> recordVideo() async {
      final uid = await storage.get('uid');
      Navigator.of(context).pop();
      final pickedFile = await picker.pickVideo(
        source: ImageSource.camera,
      );

      if (pickedFile == null) {
        Navigator.pop(context);
      } else {
        print('pickedFile.path ${pickedFile.path}');
        // Navigator.of(context).pop();
        final FFmpegKit _flutterFFmpeg = new FFmpegKit();

        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;
        print('temp path $tempPath');
        final fileId = DateTime.now().millisecondsSinceEpoch;
        signupWatcher.setIsFileUploading(true);
        FFmpegKit.executeAsync('-i ${pickedFile.path} -c:v mpeg4 $tempPath/$fileId.mp4', (session) async {
          final returnCode = await session.getReturnCode();

          if (ReturnCode.isSuccess(returnCode)) {
              File file = File("$tempPath/$fileId.mp4");
              final response = await userStore.uploadFile(file, uid);
              print('response $response');
              if(response != ""){
                signupWatcher.changeFileUploaded(true);
                signupWatcher.changeUserVideo(response);
              }
              signupWatcher.setIsFileUploading(false);
          } else if (ReturnCode.isCancel(returnCode)) {
            print('CANCEL');
            // CANCEL print('success');
            signupWatcher.setIsFileUploading(false);
          } else {
            print('ERROR');
            // ERROR
            signupWatcher.setIsFileUploading(false);
          }
        });
      }
    }

    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 218,
        width: 370,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Container(
                    height: 30,
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                        backgroundColor: Apptheme.eventCardColorlight,
                        child: Image(image: AssetImage(closeIcon))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.0,
                ),
                child: Text(
                  "SheDistrict has requested access to your camera/photos",
                  // "SheDistrict app request to use Camera",
                  style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.assentColor,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.0,
                  top: 30,
                ),
                child: GestureDetector(
                  onTap: () async{
                    await recordVideo();
                    // uploadVideoWatcher.changeVideoUploaded(true);
                  },
                  child: Text(
                    "Allow",
                    style: Apptheme(context).boldText.copyWith(
                          color: Apptheme.primaryColor,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.0,
                  top: 15,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Dismiss",
                    style: Apptheme(context).boldText.copyWith(
                          color: Apptheme.assentColor,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
