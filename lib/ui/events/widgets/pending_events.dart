import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shedistrict/ui/events/widgets/pending_event_card.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

class PendingEvents extends StatelessWidget {
  const PendingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Container(
        child: ListView(
          children: [
            PendingEventsCard(),
            SizedBox(height: 10),
            PendingEventsCard(),
            SizedBox(height: 10),
            PendingEventsCard(),
          ],
        ),
      ),
    );
  }
}
