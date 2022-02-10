import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/providers/auth/core/auth_core_provider.dart';

import 'package:shedistrict/ui/core/back_icon.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:shedistrict/utlis/constants/rules_text.dart';

class RulesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final authcoreWatcher = watch(authCoreProvider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Image(
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(30),
                  image: AssetImage("assets/images/SheRules.png"),
                  // fit: BoxFit.fill,
                ),
                SizedBox(height: size.height * 0.06),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "1. Be Unapologetic",
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.labelTextSize,
                      color: Apptheme.assentColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule1,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "2. Set Healthy Boundaries",
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.labelTextSize,
                      color: Apptheme.assentColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule2,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "3. Trust and Loyalty",
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.labelTextSize,
                      color: Apptheme.assentColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule3,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "4. Commitment and Consistency",
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.labelTextSize,
                      color: Apptheme.assentColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule4,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "5. Respect Each Other",
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.labelTextSize,
                      color: Apptheme.assentColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule5,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "6. Have Fun",
                    style: TextStyle(
                      fontSize: Apptheme.labelTextSize,
                      color: Apptheme.assentColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    rule6,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  transform: Matrix4.translationValues(-10, 0.0, 0.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            side: BorderSide(
                              color: Apptheme.primaryColor,
                            ),
                            value: authcoreWatcher.rulesBool,
                            checkColor: Apptheme.assentColor,
                            onChanged: (value) {
                              debugPrint("i m $value");
                              authcoreWatcher.changeRulesBool(value!);
                            }),
                        Text(
                          "I have read the rules and I agree",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400
                          )
                        )
                      ]),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // transform: Matrix4.translationValues(-10, 0.0, 0.0),
                      child: InkWell(
                        child : BackIcon(
                          icon: Icons.arrow_back_ios,
                        ),
                        onTap : () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      child: InkWell(
                        child : BackIcon(
                          icon: Icons.arrow_forward_ios,
                        ),
                        onTap : () {
                          AutoRouter.of(context).replace(SignupScreen());
                        },
                      ),
                    )
                  ],
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
