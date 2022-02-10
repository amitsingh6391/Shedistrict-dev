import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;

  final String? image;

  final IconData? icon;

  ProfileMenuTile({
    required this.title,
    this.image,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Apptheme.profileColor,
      height: 54,
      child: ListTile(
        leading: icon != null
            ? Icon(
                icon,
                color: Apptheme.assentColor2,
                size: 22,
              )
            : Image(
                image: AssetImage(
                  image!,
                ),
                alignment: Alignment.center,
                width: 50,
                height: 20,
              ),
        title: Text(
          title,
          style: Apptheme(context).normalText.copyWith(fontSize: 17),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: Apptheme.assentColor2,
        ),
      ),
    );
  }
}
