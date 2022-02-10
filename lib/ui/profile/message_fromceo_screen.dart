import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class MessageFromCEOScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;s
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 44 + 12,
        ),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(children: [
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Apptheme.primaryColor,
                    ),
                  ),
                  // SizedBox(width: size.width * 0.21),
                  Expanded(
                    child: Center(
                      child: Image(
                        height: 25,
                        image: AssetImage(messageFromCEO),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]),
                Container(
                    height: MediaQuery.of(context).size.height  - 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Text("Hey, girl! Thank you for joining us.", style: Apptheme(context).normalText.copyWith(fontSize: Apptheme.normalTextSize),),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(
                            left: leftPadding,
                            right: rightpadding,
                          ),
                          child: Text(
                            messageFromCEOtext,
                            textAlign: TextAlign.center,
                            style: Apptheme(context).normalText.copyWith(
                              fontSize: Apptheme.normalTextSize,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              Text(
                                "Follow Us:",
                                style: Apptheme(context).lightText.copyWith(
                                    fontSize: Apptheme.normalTextSize,
                                    color: Color.fromRGBO(142, 142, 142, 1)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 8),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image(
                                      image: AssetImage(instagram),
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image(
                                      image: AssetImage(
                                        twitter,
                                      ),
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
