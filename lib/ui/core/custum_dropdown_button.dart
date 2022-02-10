import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<String> items;
  final String? hintText;
  final Color? backgroundColor;

  final void Function(String?)? onChanged;
  final void Function()? onTap;
  CustomDropDownButton({
    required this.items,
    this.hintText,
    this.backgroundColor,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // right: 8.0,
        top: 8.0,
        bottom: 8,
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,

              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(value),
              ),
            );
          }).toList(),
          hint: Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(hintText!),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(
              right: 15.0,
            ),
            child: Image(
              image: AssetImage(arrowdropDown),
              height: 15,
              width: 15,
            ),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            contentPadding: EdgeInsets.all(0),
            filled: true,
            fillColor: backgroundColor != null
                ? backgroundColor
                : Apptheme.filterlightColor,
          ),
          onChanged: onChanged,
          onTap: onTap,
        ),
      ),
    );
  }
}
