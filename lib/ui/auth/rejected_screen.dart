import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class RejectedScreen extends StatelessWidget {
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
            children: [
              SizedBox(height: size.height * 0.2),
              Hero(
                tag: 'applogo',
                child: Applogo(
                  height: 220,
                  width: 220,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                "Rejected!",
                style: Apptheme(context).boldText.copyWith(
                  fontSize: 24,
                  color: Apptheme.assentColor2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: size.height * 0.05,
                  left: leftPadding,
                  right: rightpadding,
                ),
                child: Center(
                  child: Text(
                    'Unfortunately, your profile has been rejected.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w300,
                        color: Apptheme.assentColor2,
                        wordSpacing: 2),
                  ),
                ),
              ),
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () {
                    AutoRouter.of(context).replace(WelcomeScreen());
                  },
                  child: Text('Exit', style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor:  Apptheme.primaryColor,
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
