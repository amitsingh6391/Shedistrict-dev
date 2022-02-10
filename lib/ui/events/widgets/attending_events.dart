import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

import 'event_card.dart';

class AttendingEvents extends StatelessWidget {
  const AttendingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today",
                  style: Apptheme(context).lightText.copyWith(
                        color: Apptheme.eventsColor,
                        fontSize: 16,
                      ),
                ),
              ),
              SizedBox(height: 10),
              EventCard(),
              SizedBox(height: toppadding),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Upcoming",
                  style: Apptheme(context).lightText.copyWith(
                        color: Apptheme.eventsColor,
                      ),
                ),
              ),
              SizedBox(height: 10),
              EventCard(),
              SizedBox(height: 10),
              EventCard(),
            ],
          ),
        ),
      ),
    );
  }
}
