import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/ui/core/rounded_button.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'block_confirmation_pop_up.dart';
import 'whydo_report_popup.dart';

class ReportPopup extends ConsumerWidget {
  final String selectedReason;
  final void Function(String?)? onReasonSelect;
  ReportPopup({
    Key? key,
    required this.selectedReason,
    this.onReasonSelect
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    print('selected reason $selectedReason');
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 340,
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
            Text(
              "Is this member bothering you or harassing you?",
              textAlign: TextAlign.center,
              style: Apptheme(context).boldText.copyWith(
                    fontSize: 20,
                    color: Apptheme.primaryColor,
                    decoration: TextDecoration.none,
                  ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                width: 140,
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pop().then(
                      (value) {
                        showGeneralDialog(
                          barrierLabel: "Barrier",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 800),
                          context: context,
                          pageBuilder: (_, __, ___) {
                            return WhyDoReportPopup(
                              onReasonSelect: onReasonSelect,
                              selectedReason: selectedReason,
                            );
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
                    );
                  },
                  child: RoundedButton(
                      isOutlined: false,
                      color: Apptheme.primaryColor,
                      textColor: Apptheme.backgroundColor,
                      text: "Report"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 140,
                child: GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      barrierLabel: "Barrier",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 800),
                      context: context,
                      pageBuilder: (_, __, ___) {
                        return BlockConfirmatationPopup();
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
                  child: RoundedButton(
                      isOutlined: false,
                      color: Apptheme.backgroundColor,
                      textColor: Apptheme.primaryColor,
                      text: "Block"),
                ),
              ),
            )
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
