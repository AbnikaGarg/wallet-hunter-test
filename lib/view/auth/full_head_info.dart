import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:wallethunter/controllers/register_controller.dart';
import 'package:wallethunter/theme/app_colors.dart';

import '../../components/button.dart';
import 'register_screen.dart';

class FullHeadInfo extends StatelessWidget {
  const FullHeadInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Full head information"),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: GetBuilder<RegisterController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        color: const Color.fromARGB(
                          255,
                          79,
                          79,
                          79,
                        ).withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 6,
                      ),
                    ],
                    color: AppTheme.whiteBackgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "👤 Head Profile Summary",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.blackColor,
                        ),
                      ),
                      SizedBox(height: 6),
                      Divider(),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['name'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Age",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['age'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Occupation",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['occupation'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gender",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['gender'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Samaj",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['samaj'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Qualification",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['qualification'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        color: const Color.fromARGB(
                          255,
                          79,
                          79,
                          79,
                        ).withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 6,
                      ),
                    ],
                    color: AppTheme.whiteBackgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "📞 Contact Information",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.blackColor,
                        ),
                      ),
                      SizedBox(height: 6),
                      Divider(),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['phone'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['email'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Alt. Phone",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['altPhone'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Landline",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['landline'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SocialLink    ",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              controller.headDataResponse['socialLink'],
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.linkColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        color: const Color.fromARGB(
                          255,
                          79,
                          79,
                          79,
                        ).withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 6,
                      ),
                    ],
                    color: AppTheme.whiteBackgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "🏠 Address",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.blackColor,
                        ),
                      ),
                      SizedBox(height: 6),
                      Divider(),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pincode",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['pincode'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Flat",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['flat'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Building",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['building'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Street",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['street'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "City",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            controller.headDataResponse['city'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "district    ",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              controller.headDataResponse['district'],
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.linkColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "country    ",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              controller.headDataResponse['country'],
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.linkColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 90),
                // SectionCard(
                //   title: "🏠 Address",
                //   children: [
                //     InfoTile(label: "Flat No", value: controller.headDataResponse['flat']),
                //     InfoTile(label: "Street", value: controller.headDataResponse['street']),
                //     InfoTile(label: "City", value: controller.headDataResponse['city']),
                //     InfoTile(label: "District", value: controller.headDataResponse['district']),
                //     InfoTile(label: "State", value: controller.headDataResponse['state']),
                //     InfoTile(label: "Country", value: controller.headDataResponse['country']),
                //   ],
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
