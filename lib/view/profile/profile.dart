import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallethunter/controllers/bottom_bar_controller.dart';
import 'package:wallethunter/view/auth/login.dart';

import '../../components/dailog_helper.dart';
import '../../services/shared_pref_service.dart';
import '../../theme/app_colors.dart';
import '../auth/family_view.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 249, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 249, 255, 1),
        title: Text("Profile"),
      ),
      body: SafeArea(child: ProfileWidget()),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  final _controller = Get.put<BottomBarController>(BottomBarController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<BottomBarController>(
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // height: Get.height-300,
                  decoration: BoxDecoration(
                    color: AppTheme.whiteBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
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
                            _controller.familyMember['name'],
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
                            _controller.familyMember['age'],
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
                            _controller.familyMember['occupation'],
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
                            _controller.familyMember['gender'],
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
                            _controller.familyMember['samaj'],
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
                            _controller.familyMember['qualification'],
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

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
                          _controller.familyMember['phone'],
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
                          _controller.familyMember['email'],
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
                          _controller.familyMember['altPhone'],
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
                          _controller.familyMember['landline'],
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
                            _controller.familyMember['socialLink'],
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
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

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
                          _controller.familyMember['pincode'],
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
                          _controller.familyMember['flat'],
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
                          _controller.familyMember['building'],
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
                          _controller.familyMember['street'],
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
                          _controller.familyMember['city'],
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
                            _controller.familyMember['district'],
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
                            _controller.familyMember['country'],
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
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

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
                      ],
                    ),
                    SizedBox(height: 6),
                    Divider(),
                    SizedBox(height: 6),
                    if (_controller.familyMember['members'].isNotEmpty)
                      ...List.generate(_controller.familyMember['members'].length, (
                        index,
                      ) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              FullFamilyInfo(
                                member: controller
                                    .familyMember['members'][index],
                              ),
                            );
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
                                if (_controller
                                            .familyMember['members'][index]["path"] ==
                                        null ||
                                    _controller
                                            .familyMember['members'][index]["path"] ==
                                        "")
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppTheme.whiteBackgroundColor,
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
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      File(
                                        _controller
                                            .familyMember['members'][index]["path"],
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
                                        "${_controller.familyMember['members'][index]["name"]}",
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme.blackColor,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Relation: ${_controller.familyMember['members'][index]["relation"]}",
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
                                    _controller.deleteMemberAtIndex(index);
                                  },
                                  child: Icon(Icons.close, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                    else
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ProfileRowWidgetMobile(
                  title: 'Logout',

                  asset: Icon(Icons.logout, color: AppTheme.linkColor),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

class ProfileRowWidgetMobile extends StatelessWidget {
  ProfileRowWidgetMobile({super.key, required this.title, required this.asset});
  final String title;
  final Icon asset;
  void dialog() {
    DialogHelper.showLoading();
    Future.delayed(Duration(milliseconds: 400), () {
      PreferenceUtils().clearSharedPref();
      Get.deleteAll();
      Get.offAll(LoginScreen());
    });

    //   PreferenceUtils().remove("Token");
    //    PreferenceUtils().remove("Token");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        dialog();
      },
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),

        child: Row(
          children: [
            asset,

            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.quicksand(
                  color: AppTheme.linkColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_right, color: AppTheme.linkColor),
          ],
        ),
      ),
    );
  }
}
