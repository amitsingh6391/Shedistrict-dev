import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class ProfileApprovalConfirmatationPopup extends ConsumerWidget {
  ProfileApprovalConfirmatationPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 320,
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
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Received!",
                  textAlign: TextAlign.center,
                  style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.primaryColor,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: profileUploadConfirmatation,
                          style: Apptheme(context).lightboldText.copyWith(
                                color: Apptheme.assentColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                        ),
                        TextSpan(
                          text: '24 hours.',
                          style: Apptheme(context).lightboldText.copyWith(
                                color: Apptheme.assentColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                          // style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )

                  // Text(
                  //   profileUploadConfirmatation,
                  //   textAlign: TextAlign.center,
                  //   style: Apptheme(context).lightboldText.copyWith(
                  //         color: Apptheme.assentColor,
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w400,
                  //         decoration: TextDecoration.none,
                  //       ),
                  // ),
                  ),
              SizedBox(height: 25),
              Center(
                child: Container(
                  width: Apptheme.btnWidth,
                  height: Apptheme.btnHeight,
                  child: OutlinedButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(
                        ApprovedScreen(),
                      );
                    },
                    child:
                        Text('Got it!', style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Apptheme.primaryColor,
                      side: BorderSide(color: Apptheme.primaryColor),
                    ),
                  ),
                ),
              )
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
