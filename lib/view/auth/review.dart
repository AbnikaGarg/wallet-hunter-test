import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:wallethunter/controllers/register_controller.dart';
import 'package:wallethunter/theme/app_colors.dart';
import 'package:wallethunter/view/auth/login.dart';

import '../../components/button.dart';
import '../../components/dailog_helper.dart';
import 'family_view.dart';
import 'full_head_info.dart';
import 'register_screen.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});
  Future<bool> onwillpoo() async {
    DialogHelper.showAlertDialog(() {
      Get.offAll(LoginScreen());
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onwillpoo(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Review")),
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
                        SizedBox(height: 12),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(FullHeadInfo());
                            },
                            child: Text(
                              "View Full Information",
                              style: GoogleFonts.inter(
                                fontSize: 14,

                                fontWeight: FontWeight.w600,
                                color: AppTheme.linkColor,
                              ),
                            ),
                          ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "👨‍👩‍👧 Family Members (2)",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.blackColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.find<RegisterController>()
                                    .addFamilyMember();
                              },
                              child: Text(
                                "+ Add",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.linkColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Divider(),
                        SizedBox(height: 6),
                        if (controller.headDataResponse['members'].isNotEmpty)
                          ...List.generate(
                            controller.headDataResponse['members'].length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(FullFamilyInfo(member:controller
                                              .headDataResponse['members'][index] ,));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10, top: 10),
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 10,
                                  ),
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
                                        spreadRadius: 2,
                                      ),
                                    ],
                                    color: AppTheme.whiteBackgroundColor,
                                  ),
                                  child: Row(
                                    children: [
                                      if (controller
                                              .headDataResponse['members'][index]["path"] ==
                                          null||controller
                                              .headDataResponse['members'][index]["path"] ==
                                          
                                        "")
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  AppTheme.whiteBackgroundColor,
                                              width: 1,
                                            ),
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                "assets/icons/profile.jpeg",
                                              ),
                                              // image: controller.profileList[0].data?.profileImage.toString() !="null" && controller.profileList[0].data?.profileImage.toString()!=""? NetworkImage(data.profileImage.toString(), scale: 1.1):AssetImage('assets/images/aa.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      else
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          child: Image.file(
                                            File(
                                              controller
                                                  .headDataResponse['members'][index]["path"],
                                            ),
                                            height: 60,
                                            fit: BoxFit.cover,
                                            width: 60,
                                          ),
                                        ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.headDataResponse['members'][index]["name"]}",
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.blackColor,
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              "Relation: ${controller.headDataResponse['members'][index]["relation"]}",
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.deleteMemberAtIndex(index);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ) else
                      Center(
                        child: Text(
                          "No Family Member",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: ResuableButton(
                      ontap: () {
                        if (controller.headDataResponse['members'].isEmpty) {
                          DialogHelper.showErroDialog(
                            description: "Please add family members",
                          );
                          return;
                        }
                        controller.finalSubmit();
                      },
                      textcolor: const Color(0xFFFFFFFF),
                      title: "Confirm & Submit",
                      fontweigth: FontWeight.w700,

                      color: AppTheme.lightPrimaryColor,

                      height: 50,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
