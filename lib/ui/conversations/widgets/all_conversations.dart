import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shedistrict/ui/conversations/widgets/postbox.dart';

class AllConversations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          PostBox( conversation: {},),
          PostBox( conversation: {},),
          PostBox( conversation: {},),
        ],
      ),
    );
  }
}
