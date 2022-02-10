import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 44,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
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
                    "Privacy Policy",
                    style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.assentColor2,
                        fontSize: 26,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(width: 10),
                  Image(
                    image: AssetImage(privacypolicy),
                    height: 26,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  privacyPolicy,
                  textAlign: TextAlign.center,
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: 17,
                        wordSpacing: 3,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
