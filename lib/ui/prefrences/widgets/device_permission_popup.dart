import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/providers/prefrences/prefrences_provider.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class DevicePermissionPopup extends ConsumerWidget {
  final String favPicno;

  DevicePermissionPopup({
    Key? key,
    required this.size,
    required this.favPicno,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context, watch) {
    final prefrenceWatcher = watch(prefrencesProvider);

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
                    height: 25,
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(128, 141, 241, 0.12),
                        child: Image(image: AssetImage(closeIcon))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.0,
                ),
                child: Text(
                  "Choose picture from:",
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
                    favPicno == "1pic"
                        ? prefrenceWatcher.change1favPic()
                        : favPicno == "2pic"
                            ? prefrenceWatcher.change2favPic()
                            : favPicno == "3pic"
                                ? prefrenceWatcher.change3favPic()
                                : favPicno == "4pic"
                                    ? prefrenceWatcher.change4favPic()
                                    : debugPrint(
                                        "i did net get which pic to add");
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Camera roll",
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
                    favPicno == "1pic"
                        ? prefrenceWatcher.change1favPic()
                        : favPicno == "2pic"
                            ? prefrenceWatcher.change2favPic()
                            : favPicno == "3pic"
                                ? prefrenceWatcher.change3favPic()
                                : favPicno == "4pic"
                                    ? prefrenceWatcher.change4favPic()
                                    : debugPrint(
                                        "i did net get which pic to add");
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Photo library",
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
