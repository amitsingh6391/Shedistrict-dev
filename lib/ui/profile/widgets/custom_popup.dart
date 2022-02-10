import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class CoustomPopup extends ConsumerWidget {
  final String? msg;
  CoustomPopup({Key? key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 25,
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: Apptheme.eventCardColorlight,
                    child: Image.asset(
                      closeIcon,
                      color: Apptheme.eventsColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                msg!,
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 20,
                      color: Apptheme.assentColor2,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
        margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
