import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

// ignore: must_be_immutable
class InputTextFieldMaxlines extends StatefulWidget {
  final String hintText;
  int maxlength;
  int maxLines;
  var textLength = 0;
  var onTap;

  var validation;
  bool readOnly;
  final TextEditingController? textEditingController;
  final String counterText;
  InputTextFieldMaxlines({
    super.key,
    this.validation,
    this.textLength = 0,
    this.readOnly = false,
    required this.hintText,
    this.onTap,
    required this.maxlength,
    required this.maxLines,
    required this.counterText,
    this.textEditingController,
  });

  @override
  State<InputTextFieldMaxlines> createState() => _InputTextFieldMaxlinesState();
}

class _InputTextFieldMaxlinesState extends State<InputTextFieldMaxlines> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      minLines: widget.maxLines,
      validator: widget.validation,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      maxLength: widget.maxlength,
      controller: widget.textEditingController,
      cursorColor: AppTheme.lightPrimaryColor,
      keyboardType: TextInputType.multiline,
      onChanged: (value) {
        setState(() {
          widget.textLength = value.length;
        });
      },
      decoration: InputDecoration(
        counterText: '',
        counterStyle: GoogleFonts.openSans(
          color: AppTheme.whiteBackgroundColor,
          fontSize: 12,
        ),

        // enabledBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: Color.fromRGBO(240, 247, 253, 1),
        //     width: 1,
        //   ),
        //   borderRadius: BorderRadius.circular(8),
        // ),
        isDense: true,
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
 fillColor: AppTheme.backGround2,
        hintText: widget.hintText,
        floatingLabelStyle: const TextStyle(
          color: Color.fromRGBO(245, 73, 53, 1),
        ),
      ),
    );
  }
}
