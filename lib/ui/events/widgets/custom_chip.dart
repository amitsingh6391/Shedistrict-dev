import 'package:flutter/material.dart';

import '../../../utlis/constants/asset_path.dart';
import '../../theme/apptheme.dart';

class CustomChip extends StatelessWidget {
  late final String name;
  CustomChip({required this.name});
  // TODO
  // Need to be more customize after
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Row(
        children: [
          Text(name),
          const SizedBox(
            width: 3,
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Apptheme.eventCardColor,
            child: Image.asset(closeIcon),
          )
        ],
      ),
    );
  }
}
