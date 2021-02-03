import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_owl/resources/app_colors.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double size;
  final Color textColor;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final FontWeight fontWeight;
  final String fontFamily;
  final double letterSpacing;
  final TextDecoration textDecoration;
  final double height;

  const TitleText(this.title,
      {this.textColor,
      this.size = 24,
      this.textAlign = TextAlign.center,
      this.overflow = TextOverflow.clip,
      this.maxLines,
      this.fontWeight,
      this.fontFamily,
      this.textDecoration,
      this.letterSpacing,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
            color: (textColor == null) ? AppColors.BLACK : textColor,
            fontSize: size.sp,
            height: height,
            decoration: textDecoration,
            letterSpacing: letterSpacing,
            fontStyle: FontStyle.normal,
            fontFamily: fontFamily != null ? fontFamily : "Arial",
            fontWeight: fontWeight));
  }
}

class InputTextField extends StatelessWidget {
  final String hint;
  final double size;
  final Color textColor;
  final String fontFamily;
  final TextEditingController textEditingController;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final FontWeight fontWeight;
  final String labelText;
  final int minLines;
  final int maxLines;
  final TextStyle labelStyle;
  final TextInputFormatter textInputFormatter;
  final FormFieldValidator<String> validator;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final TextStyle hintTextStyle;
  final UnderlineInputBorder underlineInputBorder;
  final TextInputType textInputType;

  InputTextField(
      {this.hint,
      this.size,
      this.textColor,
      this.fontFamily,
      this.textEditingController,
      this.prefixIcon,
      this.suffixIcon,
      this.fontWeight,
      this.labelText,
      this.minLines,
      this.maxLines,
      this.labelStyle,
      this.textInputFormatter,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.hintTextStyle,
      this.underlineInputBorder,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: textInputType != null ? textInputType : TextInputType.number,
        validator: validator,
        style: TextStyle(
            fontFamily: fontFamily != null ? fontFamily : "Arial",
            fontSize: size.sp,
            fontWeight: fontWeight != null ? fontWeight : FontWeight.w400,
            color: textColor != null ? textColor : AppColors.BLACK),
        inputFormatters:
            textInputFormatter != null ? [textInputFormatter] : null,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: underlineInputBorder != null
              ? underlineInputBorder
              : InputBorder.none,
          enabledBorder: underlineInputBorder != null
              ? underlineInputBorder
              : InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
           contentPadding: EdgeInsets.only(bottom: 5.h),
          labelText: labelText,
          labelStyle: labelStyle != null
              ? labelStyle
              : TextStyle(
                  fontFamily: fontFamily != null ? fontFamily : "Arial",
                  fontSize: size.sp,
                  fontWeight: fontWeight != null ? fontWeight : FontWeight.w400,
                  color: textColor != null ? textColor : AppColors.BLACK),
          hintStyle: hintTextStyle != null
              ? hintTextStyle
              : TextStyle(
                  fontFamily: fontFamily != null ? fontFamily : "Arial",
                  fontSize: size.sp,
                  fontWeight: fontWeight != null ? fontWeight : FontWeight.w400,
                  color: textColor != null ? textColor : AppColors.BLACK),
        ),
        onChanged: onChanged,
        onSaved: onSaved,
      ),
    );
  }
}
