import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

import 'invitation_popup.dart';

class PendingEventsCard extends StatelessWidget {
  const PendingEventsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool _fromTop = true;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:() {
        showGeneralDialog(
          barrierLabel: "Barrier",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: Duration(milliseconds: 800),
          context: context,
          pageBuilder: (_, __, ___) {
            return Invitationpopup();
          },
          transitionBuilder: (_, anim, __, child) {
            return SlideTransition(
              position:
              Tween(begin: Offset(1, 3), end: Offset(0, 0))
                  .animate(anim),
              child: child,
            );
          },
        );
      },
      child: Container(
        // color: Apptheme.eventCardColor,
        decoration: BoxDecoration(
          color: Apptheme.eventCardColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
                left: 20,
                right: 20,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    ceoDp,
                  ),
                  radius: 27,
                ),
              ),
            ),
            Container(
              // color: Colors.red,
              child: Padding(
                padding: EdgeInsets.only(
                  top: toppadding,
                  bottom: bottomPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: Wrap(
                          children: [
                            Text('Anna Gray', style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(" invited you"),
                            Text(" to an"),
                            Text(" event")
                          ]
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Today, 9:30 PM",
                      style: Apptheme(context).lightText.copyWith(
                        fontSize: 13,
                        color: Apptheme.eventsColor,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          barrierLabel: "Barrier",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 800),
                          context: context,
                          pageBuilder: (_, __, ___) {
                            return Invitationpopup();
                          },
                          transitionBuilder: (_, anim, __, child) {
                            return SlideTransition(
                              position:
                              Tween(begin: Offset(1, 3), end: Offset(0, 0))
                                  .animate(anim),
                              child: child,
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            LineIcons.eye,
                            color: Apptheme.eventsColor,
                            size: 20,
                          ),
                          Text(
                            "  View",
                            style: Apptheme(context).lightText.copyWith(
                              fontSize: 13,
                              color: Apptheme.eventsColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
