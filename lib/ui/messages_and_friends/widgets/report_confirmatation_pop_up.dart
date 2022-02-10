import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class ReportConfirmatationPopup extends ConsumerWidget {
  ReportConfirmatationPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height > 570 ? 380 : 450,
        margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
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
                    backgroundColor: Color.fromRGBO(236, 119, 200, 0.12),
                    child: Image.asset(
                      closeIcon,
                      color: Apptheme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Thank you for letting us know!",
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 20,
                      color: Apptheme.primaryColor,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(
                left: leftPadding,
                right: rightpadding,
                bottom: bottomPadding,
              ),
              child: Text(
                reportConfirmatation,
                textAlign: TextAlign.center,
                style: Apptheme(context).normalText.copyWith(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
