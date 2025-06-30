import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/multiline_textbox.dart';
import '../../../components/user_input_field.dart';
import '../../../controllers/register_controller.dart';
import '../../../theme/app_colors.dart';

buildAddressForm(context, RegisterController _controller, GlobalKey key) {
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
                "Address Information",
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pincode",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController: _controller.pincodeController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Pincode is required";
                            }
                            return null;
                          },
                          textInputType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],

                          hintText: "",

                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "State",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController: _controller.stateController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "State is required";
                            }
                            return null;
                          },

                          hintText: "",

                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "City",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController: _controller.cityController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "City is required";
                            }
                            return null;
                          },

                          hintText: "",

                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "District",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController: _controller.districtController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "District is required";
                            }
                            return null;
                          },

                          hintText: "",

                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Native City",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController:
                              _controller.nativeCityController,

                          hintText: "",

                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Native State",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextField(
                          textEditingController:
                              _controller.nativeStateController,

                          hintText: "",

                          color: const Color(0xff585A60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Country",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.countryController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Country is required";
                  }
                  return null;
                },

                hintText: "",

                color: const Color(0xff585A60),
              ),

              SizedBox(height: 20),
              Text(
                "Flat Number/Building Name",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.buildingController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Flat Number is required";
                  }
                  return null;
                },

                hintText: "",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),

              Text(
                "Street Name",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.streetController,
                hintText: "",

                color: const Color(0xff585A60),
              ),
              SizedBox(height: 20),
              Text(
                "Landmark",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              MyTextField(
                textEditingController: _controller.landmarkController,

                hintText: "",

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
