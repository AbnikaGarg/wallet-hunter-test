import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/multiline_textbox.dart';
import '../../../components/user_input_field.dart';
import '../../../controllers/register_controller.dart';
import '../../../theme/app_colors.dart';

buildContactForm(contex, RegisterController _controller,GlobalKey key) {
  return Expanded(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Contact Information",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.blackColor,
                ),
              ),
              SizedBox(height: 10),
              // SizedBox(height: 6),
              // Text(
              //   "Let us get to know you a bit better by sharing your personal info",
              //   style: GoogleFonts.inter(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w400,
              //     color: AppTheme.blackColor,
              //   ),
              // ),
              SizedBox(height: 10),
              Text(
                "Email ID",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.emailController,
                validation: (value) {
                  RegExp emailValidatorRegExp = RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                  );
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!emailValidatorRegExp.hasMatch(value.trim())) {
                    return "Enter valid Email";
                  }
                  return null;
                },

                hintText: "EX: abc@gmail.com ",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),

              Text(
                "Phone Number",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.phoneController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone Number is required";
                  }
                  return null;
                },
                textInputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                hintText: "Ex 91XXXXXXXX",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),
              Text(
                "Altername Phone Number",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.altPhoneController,
                textInputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],

                hintText: "Ex 91XXXXXXXX",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),
              Text(
                "Landline Number",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.landlineController,
                textInputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],

                hintText: "Ex 0122XXXXXX",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),
              Text(
                "Social Links",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.socialLinkController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Social Links is required";
                  }
                  return null;
                },

                hintText: "EX: instragram/Facebook ",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
  );
}
