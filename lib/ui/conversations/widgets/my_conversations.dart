import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shedistrict/ui/conversations/widgets/postbox.dart';

class MyConversations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 0,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              // Row(
              //   children: [
              //     SizedBox(width: 17),
              //     Text(
              //       "Newest to Oldest",
              //       style: Apptheme(context).lightText,
              //     ),
              //     IconButton(
              //       onPressed: () {},
              //       icon: sort,
              //     )
              //   ],
              // ),
              Card(
                child: PostBox(
                  tags: "In Friends Needed",
                  conversation: {},
                ),
              ),
              Card(
                child: PostBox(
                  tags: "In Help Wanted",
                  conversation: {},
                ),
              ),
              Card(
                child: PostBox(
                  tags: "In just Chatting",
                  conversation: {},
                ),
              ),
            ],
          ),
        ));
  }
}
