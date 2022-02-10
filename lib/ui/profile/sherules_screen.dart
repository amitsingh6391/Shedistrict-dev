import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:shedistrict/utlis/constants/rules_text.dart';

class SheRulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            top: 44,
            right: 20,
          ),
          child: Container(
            child: Column(
              children: [
                Row(children: [
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Apptheme.primaryColor,
                    ),
                  ),
                  // SizedBox(width: size.width * 0.21),
                  Expanded(
                    child: Center(
                      child: Image(
                        height: ScreenUtil().setHeight(30.h),
                        image: AssetImage(sheRules),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: topPadding1 - 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " 1. Be Unapologetic",
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 17,
                          color: Apptheme.assentColor2,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule1,
                    style: Apptheme(context).normalText.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " 2. Set Healthy Boundaries",
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 17,
                          color: Apptheme.assentColor2,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule2,
                    style: Apptheme(context).normalText.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " 3. Trust and Loyalty",
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 17,
                          color: Apptheme.assentColor2,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule3,
                    style: Apptheme(context).normalText.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " 4. Commitment and Consistency",
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 17,
                          color: Apptheme.assentColor2,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule4,
                    style: Apptheme(context).normalText.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " 5. Respect Each Other",
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 17,
                          color: Apptheme.assentColor2,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule5,
                    style: Apptheme(context).normalText.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " 6. Have Fun",
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 17,
                          color: Apptheme.assentColor2,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule6,
                    style: Apptheme(context).normalText.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
