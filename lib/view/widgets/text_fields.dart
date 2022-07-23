import 'package:flutter/material.dart';

class MyTextFormFields{

  static Widget getForum({BuildContext? context, String? s, int? maxLines, int? maxLength, EdgeInsets? paddig, TextStyle? style}){
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLines,
      style: style,
      decoration: InputDecoration(
        hintText: s,
        contentPadding: paddig,
        border: OutlineInputBorder(),
      ),
    );
  }

  static Widget getText({BuildContext? context, String? s, EdgeInsets? margin, TextStyle? style, Alignment? align, TextAlign? txtAlign}){
    return Container(
      alignment: align,
      margin: margin,
      child: Text(
        s!,
        style: style,
        textAlign: txtAlign,
      ),
    );
  }
}