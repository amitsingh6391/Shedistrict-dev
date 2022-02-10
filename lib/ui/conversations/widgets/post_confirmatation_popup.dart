import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class PostConfirmatationPopup extends ConsumerWidget {
  final String selectedCategory;
  PostConfirmatationPopup({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 165,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Align(
              child: GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                child: Container(
                  height: 20,
                  alignment: Alignment.topRight,
                  child: Image(
                    image: AssetImage(closeIcon),
                    color: Apptheme.conversattionColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Congrats!',
                style: Apptheme(context).boldText.copyWith(
                  color: Apptheme.conversattionColor,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.center,
              child: Text(
                  "Your post has been created in the '${this.selectedCategory}' category.",
                textAlign: TextAlign.center,
                style: Apptheme(context).normalText.copyWith(
                  color: Apptheme.assentColor,
                  fontSize: Apptheme.normalTextSize,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.h),
        )
        ),
    );
  }
}
