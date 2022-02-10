import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(
              decoration: BoxDecoration(
                color: Apptheme.eventCardColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: toppadding,
                          left: leftPadding - 10,
                          right: rightpadding,
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
                            right: rightpadding,
                            bottom: bottomPadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Meeting in 7 Hours",
                                style: Apptheme(context).normalText.copyWith(
                                      color: Color(0xff808DF1),
                                      fontSize: 13,
                                    ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "New Friends Meetup with anna Graya",
                                textAlign: TextAlign.start,
                                style: Apptheme(context).boldText.copyWith(
                                      fontSize: 15.sp,
                                    ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "We've been very good internet friends with isabella,let's meet!",
                                style: Apptheme(context).lightText.copyWith(
                                      fontSize: 15,
                                  color: Color(0xFF101010)
                                    ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  Icon(FeatherIcons.mapPin, size: 20, color: Apptheme.eventsColor),
                                  SizedBox(width: 10.w),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Times Cafe",
                                          textAlign: TextAlign.left,
                                          style:
                                          Apptheme(context).lightText.copyWith(
                                            color: Apptheme.eventsColor,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          "9974 Lookout St.",
                                          style:
                                          Apptheme(context).lightText.copyWith(
                                            color: Apptheme.eventsColor,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          "Brooklyn, NY 12338",
                                          style:
                                          Apptheme(context).lightText.copyWith(
                                            color: Apptheme.eventsColor,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(FeatherIcons.calendar, size: 20, color: Apptheme.eventsColor),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                    child: Text(
                                      "June 11, 2021",
                                      style:
                                          Apptheme(context).lightText.copyWith(
                                                color: Apptheme.eventsColor,
                                            fontSize: 13.sp,
                                              ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  Icon(FeatherIcons.clock, size: 20, color: Apptheme.eventsColor),
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Text(
                                      "6:00 pm",
                                      style:
                                          Apptheme(context).lightText.copyWith(
                                                color: Apptheme.eventsColor,
                                                fontSize: 13.sp,
                                              ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
