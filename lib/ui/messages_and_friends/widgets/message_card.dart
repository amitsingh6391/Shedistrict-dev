import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class MessageCard extends StatelessWidget {
  final String currentMsg;
  final String friendDp;
  final String? time;
  final String friendName;
  const MessageCard({
    Key? key,
    required this.currentMsg,
    required this.friendDp,
    this.time,
    required this.friendName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomPadding - 5),
      decoration: BoxDecoration(
        color: Apptheme.secondaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Container(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  friendDp,
                ),
                radius: 20,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: bottomPadding,
                right: rightpadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friendName,
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 15,
                          color: Apptheme.assentColor,
                        ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          currentMsg,
                          // overflow: TextOverflow.ellipsis,
                          style: Apptheme(context).lightText.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Spacer(),
                      time != null
                          ? Text(
                              "$time",
                              style: Apptheme(context).lightText.copyWith(
                                    fontSize: 12,
                                    color: Apptheme.lightbuttonColor,
                                  ),
                            )
                          : SizedBox()
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
