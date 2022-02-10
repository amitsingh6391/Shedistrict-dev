import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class SheProtectsPopup extends StatelessWidget {
  const SheProtectsPopup({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 350,
        width: size.width * 0.8,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25,
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: Apptheme.eventCardColor,
                      child: Icon(
                        Icons.close,
                        color: Apptheme.eventsColor,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "What is SheProtects?",
                  style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.eventsColor,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  whatsSheProtects,
                  style: Apptheme(context).normalText.copyWith(
                      decoration: TextDecoration.none,
                      fontSize: Apptheme.normalTextSize,
                      wordSpacing: 2,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
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
