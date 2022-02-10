import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class ApprovedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: leftPadding,
            right: rightpadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.2),
              Hero(
                tag: "applogo",
                child: Applogo(
                  height: 220,
                  width: 220,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                "Approved!",
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 24,
                      color: Apptheme.assentColor2,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: size.height * 0.05),
                child: Center(
                  child: Text(
                    accountApprovedMsg,
                    textAlign: TextAlign.center,
                    style: Apptheme(context).normalText.copyWith(
                          fontSize: 16,
                          color: Apptheme.assentColor2,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ),
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () {
                    AutoRouter.of(context).replace(ShowYourFavPictureScreen());
                  },
                  child:
                      Text("Let's go!", style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Apptheme.primaryColor,
                    side: BorderSide(color: Apptheme.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
