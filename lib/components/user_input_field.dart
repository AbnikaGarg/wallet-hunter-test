import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class MyTextField extends StatelessWidget {
  String hintText;
  var color;
  var fillcolor;
  var icon;
  var preicon;
  bool readOnly;
  var validation;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  var ontap;
  var ontapSuffix;
  final bool obsecureText;
  final bool isSuffixIcon;
  final TextEditingController? textEditingController;
  MyTextField({
    super.key,
    required this.hintText,
    required this.color,
    this.icon,
    this.fillcolor = Colors.white,
    this.ontapSuffix,
    this.obsecureText = false,
    this.isSuffixIcon = false,
    this.readOnly = false,
    this.preicon,
    this.ontap,
    this.textInputType,
    this.inputFormatters,
    this.textEditingController,
    this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      onTap: ontap,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      controller: textEditingController,
      obscureText: obsecureText,
      validator: validation,
      cursorColor: AppTheme.lightPrimaryColor,

      // cursorHeight: 20.h,
      //  textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        labelStyle: GoogleFonts.quicksand(fontSize: 14),
        counterText: '',
        errorStyle: GoogleFonts.quicksand(fontSize: 12),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(225, 30, 61, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        hintStyle: GoogleFonts.quicksand(fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(228, 223, 223, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),

        //  isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(228, 223, 223, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color.fromRGBO(228, 223, 223, 1),
            width: 1,
          ),
        ),

        contentPadding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        filled: true,
        prefixIcon: preicon,
        // prefix: preicon,
        prefixIconColor: AppTheme.lightTextColor,
        fillColor: AppTheme.backGround2,
        //  contentPadding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 15),
        hintText: hintText,
        floatingLabelStyle: const TextStyle(
          color: Color.fromRGBO(245, 73, 53, 1),
        ),
        suffixIcon: isSuffixIcon
            ? GestureDetector(
                child: !obsecureText
                    ? Icon(Icons.visibility_off, size: 16, color: Colors.grey)
                    : Icon(Icons.visibility, size: 16, color: Colors.grey),
                onTap: ontapSuffix,
              )
            : icon,
      ),
    );
  }
}
