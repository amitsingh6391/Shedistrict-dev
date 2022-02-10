import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/ui/core/rounded_button.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'custom_popup.dart';

class DeleteAccountPopup extends ConsumerWidget {
  DeleteAccountPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 25,
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: Apptheme.eventCardColorlight,
                    child: Image.asset(
                      closeIcon,
                      color: Apptheme.eventsColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Are you sure you want to\n delete your profile?",
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 20,
                      color: Apptheme.assentColor2,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                  child: Container(
                    width: size.width > 330 ? 140 : 110,
                    child: RoundedButton(
                        isOutlined: false,
                        color: Apptheme.backgroundColor,
                        textColor: Apptheme.assentColor2,
                        text: "Cancel"),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pop().then((value) {
                      showGeneralDialog(
                        barrierLabel: "Barrier",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 800),
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return CoustomPopup(
                              msg: "Your profile has been\n deleted.");
                        },
                        transitionBuilder: (_, anim, __, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(1, 3), end: Offset(0, 0))
                                    .animate(anim),
                            child: child,
                          );
                        },
                      );
                    });
                  },
                  child: Container(
                    width: size.width > 330 ? 140 : 110,
                    child: RoundedButton(
                        isOutlined: false,
                        color: Apptheme.eventsColor,
                        textColor: Apptheme.backgroundColor,
                        text: "Delete"),
                  ),
                )
              ],
            )
          ],
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
