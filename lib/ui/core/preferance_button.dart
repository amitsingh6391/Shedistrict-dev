import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shedistrict/ui/core/preferance_options.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class PreferanceButton extends StatelessWidget {
  List<String> options;
  String name;
  String hintText;
  String selected;
  bool isVisible;
  Color? color;
  Color? iconColor;
  final void Function(String?, String?)? onChanged;
  final void Function(String?)? onVisible;

  PreferanceButton({
    required this.options,
    required this.name,
    required this.hintText,
    required this.selected,
    this.onChanged,
    this.onVisible,
    required this.isVisible,
    this.color,
    this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){ onVisible!(name);},
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 6),
        decoration: BoxDecoration(
            color: color != null ? color : Apptheme.filterlightColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right : 20),
              height: Apptheme.btnHeight,
              decoration: BoxDecoration(
                color: color != null ? color : Apptheme.filterlightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(hintText, style: TextStyle(fontSize: Apptheme.normalTextSize)),
                  this.isVisible
                      ?
                  Icon(FeatherIcons.chevronUp, size: 25, color: iconColor != null ? iconColor : Color(0XFF60EDAC))
                      :
                  Icon(FeatherIcons.chevronDown, size: 25, color: iconColor != null ? iconColor : Color(0XFF60EDAC))
                ],
              ),
            ),
            this.isVisible
                ?
            Container(
              transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              padding: const EdgeInsets.only(left: 10, right : 10),
              decoration: BoxDecoration(
                color:color != null ? color : Apptheme.filterlightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: PreferenceOptions(
                options: options,
                name: name,
                color: color,
                iconColor: iconColor,
                selected: selected,
                onChanged: this.onChanged,
              ),
            )
                :
            SizedBox()
          ],
        ),
      ),
    );
  }
}