import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color? color;
  final Alignment? alignment;
  final int? maxLine;
  final double? height;
  final double? width;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;


   const CustomText({Key? key,
    this.text = '',
    this.fontSize = 14,
    this.color = Colors.black,
    this.alignment ,
    this.maxLine,
    this.height = 1,
     this.width,
    this.fontWeight = FontWeight.bold,
    this.textOverflow,
     this.textAlign,
     this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
        width: width,
      child: Text(
        text!,
        textAlign: textAlign,
        style: GoogleFonts.cairo(
        textStyle:TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: textOverflow,
          decoration: textDecoration,
        ),
      ),
     maxLines: maxLine,
    )
    );
  }
}
