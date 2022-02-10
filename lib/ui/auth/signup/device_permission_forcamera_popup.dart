import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class DevicePermissionForCamera extends ConsumerWidget {
  DevicePermissionForCamera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final uploadVideoWatcher = watch(signUpProvider);



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
                    uploadVideoWatcher.changeFileUploaded(true);
                    Navigator.of(context).pop();
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
