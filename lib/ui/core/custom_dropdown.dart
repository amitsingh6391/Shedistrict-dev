import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<Map> items;
  final String? hintText;
  final Color? backgroundColor;
  final Map ? value;

  final void Function(String?)? onChanged;
  final void Function()? onTap;
  CustomDropdownButton({
    required this.items,
    this.hintText,
    this.backgroundColor,
    this.onChanged,
    this.onTap,
    this.value
  });

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    // this.onChanged!(selectedTest!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8.0,
        top: 8.0,
        bottom: 8,
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownBelow(
          itemWidth: MediaQuery.of(context).size.width - 32,
          itemTextstyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          boxTextstyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white54),
          boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
          boxWidth: MediaQuery.of(context).size.width - 32,
          boxHeight: 45,
          boxDecoration: BoxDecoration(
              color: backgroundColor != null
                  ? backgroundColor
                  : Apptheme.filterlightColor,
              border: Border.all(width: 1, color: Colors.white54), borderRadius: BorderRadius.circular(20)),
          icon: Icon(
            Icons.settings,
            color: Colors.white54,
          ),
          hint: Text(hintText!),
          value: value,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item['keyword'],
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(item['keyword']),
              ),
            );
          }).toList(),
          onChanged: onChangeDropdownTests,
        ),
      ),
    );
  }
}