import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:line_icons/line_icons.dart';

import 'package:shedistrict/ui/core/custum_textfield.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/events/widgets/custom_chip.dart';
import 'package:shedistrict/ui/events/widgets/invitation_popup.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

// ignore: must_be_immutable
class ScheduleMeetingEventScreen extends StatelessWidget {
  bool _fromTop = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            icon: Icon(FeatherIcons.xCircle, color: Apptheme.eventsColor),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Stack(fit: StackFit.expand, children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                alignment: Alignment.center,
                child: Text("Schedule a Meeting ",
                    style: Apptheme(context)
                        .normalText
                        .copyWith(color: Apptheme.eventsColor, fontSize: 20)),
              ),
              Text(
                "Invite*:",
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.eventsColor,
                      fontSize: Apptheme.normalTextSize,
                    ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: Apptheme.eventCardColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Wrap(
                  children: [
                    Row(children: [
                      CustomChip(
                        name: "Anna Gray",
                      ),
                      CustomChip(
                        name: "Lily Rose",
                      ),
                      Spacer(),
                      Icon(
                        LineIcons.plusCircle,
                        color: Apptheme.eventsColor,
                      ),
                    ])
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Name of event*:",
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.eventsColor,
                      fontSize: Apptheme.normalTextSize,
                    ),
              ),
              InputField(
                backgroundColor: Apptheme.eventCardColor,
                hintText: 'Brunch Date',
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "When*:",
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.eventsColor,
                      fontSize: Apptheme.normalTextSize,
                    ),
              ),
              Row(children: [
                Expanded(
                  flex: 2,
                  child: InputField(
                    controller: TextEditingController(text: 'July'),
                    backgroundColor: Apptheme.eventCardColor,
                    hintText: "July",
                    hintTextColor: Apptheme.eventsColor,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: InputField(
                    controller: TextEditingController(text: '30'),
                    keyboardType: TextInputType.number,
                    backgroundColor: Apptheme.eventCardColor,
                    hintText: "30",
                    hintTextColor: Apptheme.eventsColor,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: InputField(
                    textSize: 13,
                    controller: TextEditingController(text: '2021'),
                    keyboardType: TextInputType.number,
                    backgroundColor: Apptheme.eventCardColor,
                    hintText: "2021",
                    hintTextColor: Apptheme.eventsColor,
                  ),
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              Text(
                "Time*:",
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.eventsColor,
                      fontSize: Apptheme.normalTextSize,
                    ),
              ),
              Row(children: [
                Expanded(
                  flex: 2,
                  child: InputField(
                    controller: TextEditingController(text: '11:30'),
                    backgroundColor: Apptheme.eventCardColor,
                    hintText: "11:30",
                    hintTextColor: Apptheme.eventsColor,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: InputField(
                    controller: TextEditingController(text: 'AM'),
                    keyboardType: TextInputType.number,
                    backgroundColor: Apptheme.eventCardColor,
                    hintText: "AM",
                    hintTextColor: Apptheme.eventsColor,
                  ),
                ),
                Spacer()
              ]),
              SizedBox(
                height: 15,
              ),
              Text(
                "Where*:",
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.eventsColor,
                      fontSize: Apptheme.normalTextSize,
                    ),
              ),
              InputField(
                controller: TextEditingController(
                    text: 'Cafe "Friends", 578 Oak St, Manhattan, NY'),
                backgroundColor: Apptheme.eventCardColor,
                hintTextColor: Apptheme.eventsColor,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Leave a note:",
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.eventsColor,
                      fontSize: Apptheme.normalTextSize,
                    ),
              ),
              InputField(
                backgroundColor: Apptheme.eventCardColor,
                maxLines: 5,
                hintText: "Type here",
                hintTextColor: Apptheme.eventsColor,
              ),
              // SizedBox(height: 100),
              SizedBox(height: 20),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Read',
                      style: Apptheme(context).normalText.copyWith(
                            color: Apptheme.assentColor,
                            fontSize: Apptheme.normalTextSize,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Rules & Tips ',
                          style: Apptheme(context).normalText.copyWith(
                                color: Apptheme.eventsColor,
                                fontSize: Apptheme.normalTextSize,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint("naviagte");
                              AutoRouter.of(context).push(
                                RulesTipsScreen(),
                              );
                            },
                        ),
                        TextSpan(
                          text: 'before sending invitation',
                          style: Apptheme(context).normalText.copyWith(
                                color: Apptheme.assentColor,
                                fontSize: Apptheme.normalTextSize,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: RoundedButton(
                            isOutlined: true,
                            color: Apptheme.backgroundColor,
                            textColor: Apptheme.eventsColor,
                            text: "Nevermind",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // showGeneralDialog(
                            //   barrierLabel: "Label",
                            //   barrierDismissible: true,
                            //   barrierColor: Colors.black.withOpacity(0.5),
                            //   transitionDuration: Duration(milliseconds: 700),
                            //   context: context,
                            //   pageBuilder: (context, anim1, anim2) {
                            //     return Align(
                            //       alignment: _fromTop
                            //           ? Alignment.topCenter
                            //           : Alignment.bottomCenter,
                            //       child: Invitationpopup(),
                            //     );
                            //   },
                            //   transitionBuilder:
                            //       (context, anim1, anim2, child) {
                            //     return SlideTransition(
                            //       position: Tween(
                            //               begin: Offset(0, _fromTop ? -1 : 1),
                            //               end: Offset(0, 0))
                            //           .animate(anim1),
                            //       child: child,
                            //     );
                            //   },
                            // );
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: RoundedButton(
                              isOutlined: false,
                              color: Apptheme.editIconsColor,
                              textColor: Apptheme.backgroundColor,
                              text: "Send invitation",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
