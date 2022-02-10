import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class InputField extends StatefulWidget {
  final bool readOnly;
  final bool isPassword;
  final bool enabled;
  final double textSize;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Function? onDoubleTap;
  final String? helperText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final int? maxLines;
  final int? minLines;
  final String? hintText;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final bool autocorrect;
  final bool textCapitalization;

  const InputField({
    Key? key,
    this.textSize = 0,
    this.readOnly = false,
    this.isPassword = false,
    this.enabled = true,
    this.controller,
    this.keyboardType,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.onDoubleTap,
    this.helperText,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.hintText,
    this.backgroundColor,
    this.hintTextColor,
    this.textCapitalization = true,
    this.autocorrect = true
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => widget.onDoubleTap,
      child: TextFormField(
        style: TextStyle(fontSize: widget.textSize != 0 ? widget.textSize : 15),
        textAlign: TextAlign.left,
        validator: widget.validator,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        controller: widget.controller,
        obscureText: obscureText,
        autocorrect: widget.autocorrect,
        minLines: widget.minLines,
        textCapitalization: widget.textCapitalization ? TextCapitalization.sentences : TextCapitalization.none,
        maxLines: !widget.isPassword ? widget.maxLines : 1,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        onTap: widget.onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          // EdgeInsets.all(20),
          filled: true,
          fillColor: widget.backgroundColor,
          helperText: widget.helperText,
          labelStyle: Apptheme(context).thinText.copyWith(
                color: Apptheme.primaryColor,
                wordSpacing: 2,
              ),
          hintStyle: Apptheme(context).normalText.copyWith(
                color: widget.hintTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
          suffixIcon: widget.isPassword
              ? InkResponse(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    layoutBuilder: (currentChild, previousChildren) =>
                        !obscureText
                            ? Icon(
                                Icons.remove_red_eye,
                                color: widget.suffixIconColor,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: widget.suffixIconColor,
                              ),
                  ),
                )
              : (widget.suffixIcon),
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
