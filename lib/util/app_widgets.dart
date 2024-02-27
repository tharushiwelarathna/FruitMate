import 'package:flutter/material.dart';
import 'package:fruitmate_app/util/app_colors.dart';
import 'package:get/get.dart';

class AppWidgets {
  static showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: "Close",
        textColor: AppColors.green,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static regularText(
      {text,
      required double size,
      color,
      alignment,
      decoration,
      weight,
      maxLines,
      textOverFlow,
      height}) {
    return Text(
      text,
      style: TextStyle(
          decoration: decoration ?? TextDecoration.none,
          fontSize: size,
          color: color,
          fontFamily: "Regular",
          fontWeight: weight,
          height: height),
      overflow: textOverFlow,
      maxLines: maxLines,
      textAlign: alignment ?? TextAlign.start,
    );
  }

  static normalTextField(
      {controller,
      hintText,
      suffixIcon,
      keyBoardType,
      style,
      validator,
      fillColor,
      textAlign,
      prefix,
      prefixIcon,
      enabled,
      onChanged,
      filled,
      obscureText,
      labelText,
      errorText,
      isUnderlinedBorder,
      maxLines,
      maxLength,
      minLines,
      fontColor,
      borderColor,
      fontSize,
      fontWeight,
      borderFillColor,
      hintFontColor,
      hintFontWeight,
      hintFontSize,
      onTap,
      inputFormatters,
      autovalidateMode,
      helperText}) {
    return TextFormField(
      onTap: onTap,
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      textInputAction: TextInputAction.next,
      cursorColor: AppColors.black,
      textAlign: textAlign,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      maxLength: maxLength,
      minLines: minLines,
      autocorrect: false,
      style: TextStyle(
        color: fontColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: hintFontColor,
          fontWeight: hintFontWeight,
          fontSize: hintFontSize,
        ),
        errorMaxLines: 5,
        helperText: helperText,
        helperMaxLines: 5,
        labelText: labelText,
        labelStyle: TextStyle(color: fontColor, fontWeight: FontWeight.w400),
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        disabledBorder: InputBorder.none,
        enabledBorder: isUnderlinedBorder
            ? UnderlineInputBorder(borderSide: BorderSide(color: borderColor))
            : OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
        focusedBorder: isUnderlinedBorder
            ? UnderlineInputBorder(borderSide: BorderSide(color: borderColor))
            : OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
        border: isUnderlinedBorder
            ? UnderlineInputBorder(borderSide: BorderSide(color: borderColor))
            : OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
        filled: filled,
        fillColor: fillColor,
      ),
    );
  }
}
