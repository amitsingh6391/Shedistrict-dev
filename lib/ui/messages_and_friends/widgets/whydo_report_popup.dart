import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/ui/core/custom_dropdown.dart';

import 'package:shedistrict/ui/core/rounded_button.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

import 'report_confirmatation_pop_up.dart';

final selectedButtonProvider = ChangeNotifierProvider<Reason>((ref) => new Reason());

class Reason extends ChangeNotifier {
  String current;
  // 1
  Reason([this.current = 'Please, choose a reason']);

  // 2
  void increment(value) {
    current = value;
    notifyListeners();
  }
}

class WhyDoReportPopup extends ConsumerWidget {
  final String selectedReason;
  final void Function(String?)? onReasonSelect;

  WhyDoReportPopup({
    Key? key,
    required this.selectedReason,
    this.onReasonSelect
  }) : super(key: key);

  updateSelectedReason(v) {
    this.onReasonSelect!(v);
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    print('text selected $selectedReason');
    Size size = MediaQuery.of(context).size;
    final reason = watch(selectedButtonProvider).current;
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
        height: 340,
        width: size.width - 32,
        // color: Colors.white,
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
                "Why do you want to report her?",
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                  fontSize: 20,
                  color: Apptheme.primaryColor,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  // SizedBox(width: 18.w),
                  PopupMenuButton<String>(
                    offset: Offset(0.0, 50.0),
                    itemBuilder: (context) {
                      return <String>[
                        "She's annoying",
                        "She's harassing me",
                        'She is being inappropriate',
                        'Keeps asking to meet her too soon',
                        "I think she has a fake profile picture"
                      ].map((str) {
                        return PopupMenuItem(
                          height: 40,
                          value: str,
                          child: Text(
                            str,
                            style: Apptheme(context).normalText.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Container(
                      height: 50,
                      width: size.width - 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Apptheme.secondaryColor,
                      ),
                        child:Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                // top: 12,
                                left: leftPadding,
                              ),
                              child: Text(
                                reason,
                                textAlign: TextAlign.left,
                                style: Apptheme(context).lightboldText.copyWith(
                                  fontSize: 15,
                                  color: Apptheme.assentColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Spacer(),
                           Icon(FeatherIcons.chevronDown, color: Apptheme.primaryColor, size: 17),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                    ),
                    onSelected: (v) => context.read(selectedButtonProvider).increment(v),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width > 330 ? 140 : 120,
                  child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: RoundedButton(
                        isOutlined: false,
                        color: Apptheme.backgroundColor,
                        textColor: Apptheme.primaryColor,
                        text: "Cancel"),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: size.width > 330 ? 140 : 120,
                  child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).pop().then((value) {
                        showGeneralDialog(
                          barrierLabel: "Barrier",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 800),
                          context: context,
                          pageBuilder: (_, __, ___) {
                            return ReportConfirmatationPopup();
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
                      });
                    },
                    child: RoundedButton(
                        isOutlined: false,
                        color: Apptheme.primaryColor,
                        textColor: Apptheme.backgroundColor,
                        text: "Report"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      // content: Align(
      //   alignment: Alignment.center,
      //   child: Container(
      //     height: 340,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(height: 10),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Container(
      //             height: 25,
      //             alignment: Alignment.topRight,
      //             child: GestureDetector(
      //               onTap: () {
      //                 AutoRouter.of(context).pop();
      //               },
      //               child: CircleAvatar(
      //                 backgroundColor: Color(0xFFFDD0E8),
      //                 child: Image.asset(
      //                   closeIcon,
      //                   color: Apptheme.primaryColor,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 30),
      //         Center(
      //           child: Text(
      //             "Why do you want to report her?",
      //             textAlign: TextAlign.center,
      //             style: Apptheme(context).boldText.copyWith(
      //               fontSize: 20,
      //               color: Apptheme.primaryColor,
      //               decoration: TextDecoration.none,
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 10),
      //         Container(
      //           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      //           child: Row(
      //             children: [
      //               // SizedBox(width: 18.w),
      //               PopupMenuButton<String>(
      //                 offset: Offset(0.0, 36.0),
      //                 itemBuilder: (context) {
      //                   return <String>[
      //                     'My Conversations',
      //                     'Shameless Plugs',
      //                     'Friends(s) Needed',
      //                     'Help Wanted',
      //                     "Just chattin"
      //                   ].map((str) {
      //                     return PopupMenuItem(
      //                       value: str,
      //                       child: Text(
      //                         str,
      //                         style: Apptheme(context).normalText.copyWith(
      //                           fontSize: 17,
      //                         ),
      //                       ),
      //                     );
      //                   }).toList();
      //                 },
      //                 child:Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: <Widget>[
      //                     Text(
      //                       'Choose a reason',
      //                       style: Apptheme(context).normalText.copyWith(
      //                         fontSize: 17,
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 5,
      //                     ),
      //                     Icon(
      //                       Icons.arrow_drop_down,
      //                       color: Apptheme.conversattionColor,
      //                     ),
      //                   ],
      //                 ),
      //                 onSelected: (v) {},
      //               )
      //             ],
      //           ),
      //         ),
      //         // Padding(
      //         //   padding: const EdgeInsets.all(15.0),
      //         //   child: Container(
      //         //       height: 50,
      //         //       width: double.infinity,
      //         //       decoration: BoxDecoration(
      //         //         borderRadius: BorderRadius.circular(20),
      //         //         color: Apptheme.secondaryColor,
      //         //       ),
      //         //       child: Row(
      //         //         children: [
      //         //           Padding(
      //         //             padding: EdgeInsets.only(
      //         //               // top: 12,
      //         //               left: leftPadding,
      //         //             ),
      //         //             child: Text(
      //         //               "She's annoying",
      //         //               textAlign: TextAlign.left,
      //         //               style: Apptheme(context).lightboldText.copyWith(
      //         //                     fontSize: 15,
      //         //                     color: Apptheme.assentColor,
      //         //                     decoration: TextDecoration.none,
      //         //                   ),
      //         //             ),
      //         //           ),
      //         //           Spacer(),
      //         //           Image(
      //         //             image: AssetImage(arrowDown),
      //         //             color: Apptheme.primaryColor,
      //         //           ),
      //         //
      //         //           SizedBox(
      //         //             width: 20,
      //         //           )
      //         //           // Icon(Icons.pin_drop),
      //         //         ],
      //         //       )),
      //         // ),
      //         SizedBox(height: 30),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: size.width > 330 ? 140 : 120,
      //               child: GestureDetector(
      //                 onTap: () {
      //                   AutoRouter.of(context).pop();
      //                 },
      //                 child: RoundedButton(
      //                     color: Apptheme.backgroundColor,
      //                     textColor: Apptheme.primaryColor,
      //                     text: "Cancel"),
      //               ),
      //             ),
      //             SizedBox(
      //               width: 20,
      //             ),
      //             Container(
      //               width: size.width > 330 ? 140 : 120,
      //               child: GestureDetector(
      //                 onTap: () {
      //                   AutoRouter.of(context).pop().then((value) {
      //                     showGeneralDialog(
      //                       barrierLabel: "Barrier",
      //                       barrierDismissible: true,
      //                       barrierColor: Colors.black.withOpacity(0.5),
      //                       transitionDuration: Duration(milliseconds: 800),
      //                       context: context,
      //                       pageBuilder: (_, __, ___) {
      //                         return ReportConfirmatationPopup();
      //                       },
      //                       transitionBuilder: (_, anim, __, child) {
      //                         return SlideTransition(
      //                           position:
      //                           Tween(begin: Offset(1, 3), end: Offset(0, 0))
      //                               .animate(anim),
      //                           child: child,
      //                         );
      //                       },
      //                     );
      //                   });
      //                 },
      //                 child: RoundedButton(
      //                     color: Apptheme.primaryColor,
      //                     textColor: Apptheme.backgroundColor,
      //                     text: "Report"),
      //               ),
      //             ),
      //           ],
      //         )
      //       ],
      //     ),
      //     margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //   ),
      // ),
    );
  }
}
