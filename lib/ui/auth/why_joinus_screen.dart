import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/back_icon.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:shedistrict/utlis/constants/why_joinus_text.dart';

class WhyJoinUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                  height: 78 - 30,
                  // size.height > 600 ? size.height * 0.1 : size.height * 0.05),
              ),
              Row(
                children: [
                  IconButton(
                  iconSize: 37,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: BackIcon(
                    icon: Icons.arrow_back_ios,
                  )),
                  SizedBox(
                      width:
                      size.height > 600 ? size.width * 0.13 : size.width * .1),
                  Center(
                    child: Applogo(
                      height: size.height > 600 ? 120 : 100,
                      width: size.height > 600 ? 120 : 100,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 45),
              Align(
                alignment:  Alignment.centerLeft,
                child:Container(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child:Text(
                    "Why Join Us?",
                    style: Apptheme(context).boldText.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Apptheme.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                ) ,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  5,
                  10,
                  5,
                  0,
                ),
                child: Text(
                  para1,
                  style: Apptheme(context).normalText.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  5,
                  10,
                  5,
                  0,
                ),
                child: Text(
                  para2,
                  style: Apptheme(context).normalText.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () {
                    AutoRouter.of(context).replace(RulesScreen());
                  },
                  child: Text('Join Us',
                      style: Apptheme(context).normalText.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      )),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Apptheme.primaryColor,
                    side: BorderSide(color: Apptheme.primaryColor),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ));
  }
}
