import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/ui/core/rounded_button.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'how_it_works_pop_up.dart';
import 'meet_confirmatation_pop_up.dart';

class MeetPopup extends ConsumerWidget {
  MeetPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 450,
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
                    backgroundColor: Color.fromRGBO(236, 119, 200, 0.12),
                    child: Image.asset(
                      closeIcon,
                      color: Apptheme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Andrea Gray wants to meet!",
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 17,
                      color: Apptheme.primaryColor,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Lisa Rose is ready to meet you in\n person. Are you ready to meet\n her?",
                textAlign: TextAlign.center,
                style: Apptheme(context).lightText.copyWith(
                      fontSize: 15,
                      color: Apptheme.assentColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                width: 140,
                child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: RoundedButton(
                        isOutlined: false,
                        color: Apptheme.backgroundColor,
                        textColor: Apptheme.primaryColor,
                        text: "Not yet")
                ) ,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                width: 140,
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                  child: RoundedButton(
                      isOutlined: false,
                      color: Apptheme.backgroundColor,
                      textColor: Apptheme.primaryColor,
                      text: "No"),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                width: 140,
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pop().then(
                      (value) {
                        showGeneralDialog(
                          barrierLabel: "Barrier",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 800),
                          context: context,
                          pageBuilder: (_, __, ___) {
                            return MeetConfirmatationPopup();
                          },
                          transitionBuilder: (_, anim, __, child) {
                            return SlideTransition(
                              position: Tween(
                                      begin: Offset(
                                        1,
                                        -1,
                                      ),
                                      end: Offset(0, 0))
                                  .animate(anim),
                              child: child,
                            );
                          },
                        );
                      },
                    );
                  },
                  child: RoundedButton(
                      isOutlined: false,
                      color: Apptheme.primaryColor,
                      textColor: Apptheme.backgroundColor,
                      text: "Yes"),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pop().then(
                    (value) {
                      showGeneralDialog(
                        barrierLabel: "Barrier",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 800),
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return HowItWorksPopup();
                        },
                        transitionBuilder: (_, anim, __, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(-1, -1), end: Offset(0, 0))
                                    .animate(anim),
                            child: child,
                          );
                        },
                      );
                    },
                  );
                },
                child: Text(
                  "How it works?",
                  textAlign: TextAlign.center,
                  style: Apptheme(context).boldText.copyWith(
                        fontSize: 15,
                        color: Apptheme.primaryColor,
                        decoration: TextDecoration.none,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
