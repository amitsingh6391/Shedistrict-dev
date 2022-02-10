import 'package:flutter/material.dart';
import 'package:shedistrict/ui/conversations/conversations_screen.dart';
import 'package:shedistrict/ui/events/event_screen.dart';
import 'package:shedistrict/ui/filters/filter_results_screen.dart';
import 'package:shedistrict/ui/messages_and_friends/message_and_friends_screen.dart';
import 'package:shedistrict/ui/profile/profile_screen.dart';

tabbody(int index, Widget profilebody) {
  if (index == 0) {
    return ConverSationsScreen();
  } else if (index == 1) {
    return FilterResultsScreen();
  } else if (index == 2) {
    return EventScreen();
  } else if (index == 3) {
    return MessageAndFriendsScreen();
  } else {
    return profilebody;
  }
}
