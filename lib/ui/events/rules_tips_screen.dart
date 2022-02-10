import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:shedistrict/utlis/constants/events_rules_tips.dart';

class RulesTipsScreen extends StatelessWidget {
  const RulesTipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: toppadding,
          left: leftPadding,
          right: rightpadding,
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: rightpadding,
              ),
              child: Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Apptheme.assentColor2,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Rules & tips for a safe meeting ",
                style: Apptheme(context)
                    .normalText
                    .copyWith(color: Apptheme.eventsColor, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
              ),
              child: Text(ruleandTips1heading),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
                left: 2 * leftPadding,
              ),
              child: Text(
                ruleandTips1,
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.eventsColor,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
              ),
              child: Text(ruleandTips2heading),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
              ),
              child: Text(ruleandTips3heading),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
                left: 2 * leftPadding,
              ),
              child: Text(
                ruleandTips3,
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.eventsColor,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
              ),
              child: Text(ruleandTips4heading),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
              ),
              child: Text(ruleandTips5heading),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
              ),
              child: Text(ruleandTips6heading),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.bottomCenter,
              child: RoundedButton(
                isOutlined: false,
                color: Apptheme.eventsColor,
                textColor: Apptheme.backgroundColor,
                text: "Got it",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
