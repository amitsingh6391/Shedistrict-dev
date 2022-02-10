import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class SheUpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 44,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(children: [
                IconButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Apptheme.assentColor2,
                  ),
                ),
                Text(
                  "SheUpdate",
                  style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.assentColor2,
                        fontSize: 26,
                      ),
                ),
              ]),
              SizedBox(height: 2 * topPadding1),
              Center(
                child: Applogo(
                  height: 140,
                  width: 140,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Version 1.3',
                style: Apptheme(context).normalText.copyWith(
                      fontSize: 17,
                      color: Apptheme.eventsColor,
                    ),
              ),
              SizedBox(height: 20),
              Text(
                "Your app is up to date!",
                textAlign: TextAlign.center,
                style: Apptheme(context).normalText.copyWith(
                      fontSize: 16,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
