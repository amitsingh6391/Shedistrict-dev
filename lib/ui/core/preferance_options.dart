import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class PreferenceOptions extends StatelessWidget {
  List<String> options;
  String name;
  String selected;
  Color? color;
  Color? iconColor;
  final void Function(String?, String?)? onChanged;

  PreferenceOptions({required this.options, required this.name, required this.selected, this.onChanged, this.color, this.iconColor});

  void onSelected(name, value) {
    // this.onChanged!(name, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      child: Wrap(
          direction: Axis.horizontal, // default
          children: <Widget>[
            ...options.map((option) {
              return Container(
                margin: const EdgeInsets.all(2),
                child: ActionChip(
                  backgroundColor: color != null ? color : Apptheme.filterlightColor,
                  onPressed:() {onChanged!(name, option);},
                  avatar: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: selected == option ? (iconColor != null ? iconColor : Color(0XFF60EDAC)) : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white)
                    ),
                  ),
                  labelPadding: EdgeInsets.all(2.0),
                  label: Text(
                    option,
                    style: TextStyle(
                     fontSize: Apptheme.normalTextSize
                    ),
                  ),
                ),
              );
            })
          ]
      )
    );
  }
}