import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

class AttendedEvents extends StatelessWidget {
  const AttendedEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Yesterday",
                style: Apptheme(context).lightText.copyWith(
                      color: Apptheme.eventsColor,
                    ),
              ),
            ),
            AttendedEventCard(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Last Week",
                style: Apptheme(context).lightText.copyWith(
                      color: Apptheme.eventsColor,
                    ),
              ),
            ),
            AttendedEventCard(),
            SizedBox(height: 10),
            AttendedEventCard(),
            SizedBox(height: 10),
            AttendedEventCard(),
          ],
        ),
      ),
    );
  }
}

class AttendedEventCard extends StatelessWidget {
  const AttendedEventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(128, 141, 241, 0.1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: toppadding,
                left: leftPadding,
                right: rightpadding,
                bottom: bottomPadding,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    ceoDp,
                  ),
                  radius: 27.r,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  top: toppadding,
                  bottom: bottomPadding,
                  right: rightpadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'New Friends Meetup',
                        style: Apptheme(context).boldText.copyWith(),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' with Anna ',
                            style: Apptheme(context).normalText,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Attended",
                      style: Apptheme(context).lightText.copyWith(
                            fontSize: 13.sp,
                            color: Apptheme.eventsColor,
                          ),
                    ),
                    // SizedBox(height: 15),
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
