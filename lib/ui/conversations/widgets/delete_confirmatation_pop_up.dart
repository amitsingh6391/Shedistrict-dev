import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class PostDeleteConfirmatationPopup extends ConsumerWidget {
  PostDeleteConfirmatationPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 110,
        // width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(
                right: 15,
              ),
              child: GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                child: Container(
                  height: 20,
                  // width: 20,
                  alignment: Alignment.topRight,
                  child: Image(
                    image: AssetImage(closeIcon),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Post deleted",
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.conversattionColor,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
