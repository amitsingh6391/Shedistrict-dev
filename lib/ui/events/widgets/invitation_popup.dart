import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class Invitationpopup extends StatelessWidget {
  const Invitationpopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width - 40,
          height: 650,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 10),
                child: Container(
                  height: 25,
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: Apptheme.eventCardColor,
                      child: Icon(FeatherIcons.x, color: Apptheme.eventsColor, size: 17,),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "You are invited!",
                        style: Apptheme(context)
                            .boldText
                            .copyWith(color: Apptheme.eventsColor, fontSize: 25),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Name of Event : ",
                      style: Apptheme(context)
                          .boldText
                          .copyWith(color: Apptheme.eventsColor, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Brunch Date",
                      style: Apptheme(context).lightText.copyWith(
                        color: Apptheme.eventsColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "When : ",
                      style: Apptheme(context)
                          .boldText
                          .copyWith(color: Apptheme.eventsColor, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Monday 20,2021",
                      style: Apptheme(context).lightText.copyWith(
                        color: Apptheme.eventsColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Time : ",
                      style: Apptheme(context)
                          .boldText
                          .copyWith(color: Apptheme.eventsColor, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "11:34 AM (EST)",
                      style: Apptheme(context).lightText.copyWith(
                        color: Apptheme.eventsColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Where : ",
                      style: Apptheme(context)
                          .boldText
                          .copyWith(color: Apptheme.eventsColor, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Wicked Willy’s",
                      style: TextStyle(
                        color: Apptheme.eventsColor,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      "149 Bleecker S",
                      style: TextStyle(
                        color: Apptheme.eventsColor,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      "New York, NY 10220",
                      style: TextStyle(
                        color: Apptheme.eventsColor,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.0,
                            left: 10,
                          ),
                          child: Container(
                            width: 130,
                            height: Apptheme.btnHeight,
                            alignment: Alignment.bottomCenter,
                            child: RoundedButton(
                              isOutlined: false,
                              color: Apptheme.backgroundColor,
                              textColor: Apptheme.eventsColor,
                              text: "Deny",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.0,
                            // right: rightpadding,
                          ),
                          child: Container(
                            width: 130,
                            height: Apptheme.btnHeight,
                            alignment: Alignment.bottomCenter,
                            child: RoundedButton(
                              isOutlined: false,
                              color: Apptheme.eventsColor,
                              textColor: Apptheme.backgroundColor,
                              text: "Accept",
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: Apptheme.btnWidth,
                        height: Apptheme.btnHeight,
                        child: RoundedButton(
                          isOutlined: false,
                          color: Apptheme.backgroundColor,
                          textColor: Apptheme.eventsColor,
                          text: "  I'  ll  think about it  ",
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        )
      ),
    );
  }
}
