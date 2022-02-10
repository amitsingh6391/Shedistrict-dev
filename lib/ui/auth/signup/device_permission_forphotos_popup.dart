import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/user_store.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:image_picker/image_picker.dart';

class DevicePermissionForPhotos extends ConsumerWidget {
  DevicePermissionForPhotos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final signupWatcher = watch(signUpProvider);
    UserStore userStore = UserStore();
    ImagePicker picker = ImagePicker();
    Storage storage = Storage();

    Future<void> takePhotos() async {
      final uid = await storage.get('uid');
      Navigator.of(context).pop();
      final pickedFile = await picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 650,
          maxHeight: 650);
      if (pickedFile == null) {
        Navigator.pop(context);
      } else {
        File file = File(pickedFile.path);

        signupWatcher.setIsFileUploading(true);

        final response = await userStore.uploadFile(file, uid);
        if(response != ""){
          signupWatcher.changeFileUploaded(true);
          signupWatcher.changeUserPicture(response);
        }
        signupWatcher.setIsFileUploading(false);
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
                  onTap: () {
                    takePhotos();
                    // uploadVideoWatcher.changeVideoUploaded(true);
                    // Navigator.of(context).pop();
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
