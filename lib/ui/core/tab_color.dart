import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

Color tabColor(int index) {
  if (index == 0) {
    return Apptheme.conversattionColor;
  } else if (index == 1) {
    return Apptheme.filterColor;
  } else if (index == 2) {
    return Apptheme.eventsColor;
  } else if (index == 3) {
    return Apptheme.primaryColor;
  } else {
    return Apptheme.assentColor2;
  }
}
