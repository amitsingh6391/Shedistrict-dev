import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/apptheme.dart';

class CustomListTitle extends StatelessWidget {
  final Size size;
  final String label;
  final IconData? icon;
  final void Function() fn;
  final Widget trailing;

  final String? image;

  CustomListTitle(
      {required this.trailing,
      this.icon,
      this.image,
      required this.fn,
      required this.size,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fn,
      child: ListTile(
        trailing: trailing,
        title: Text(
          label,
          style: Apptheme(context).normalText.copyWith(
                fontSize: 17,
              ),
        ),
        leading: icon != null
            ? Icon(
                icon,
                size: 22,
                color: Apptheme.assentColor2,
              )
            : Image(
                image: AssetImage(
                  image!,
                ),
                width: 50,
                height: 20,
              ),
      ),
    );
  }
}
