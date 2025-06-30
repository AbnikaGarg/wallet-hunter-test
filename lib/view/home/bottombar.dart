import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallethunter/view/profile/profile.dart';

import '../../controllers/bottom_bar_controller.dart';
import '../../theme/app_colors.dart';
import 'family_tree.dart';
import 'samaj.dart';

class BottomBar extends StatelessWidget {

  List<Widget> pages = [FamilyTree(), SamajName(), Profile()];


  @override
  final _controller = Get.put<BottomBarController>(BottomBarController());

  BottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (controller) => LayoutBuilder(
        // If our width is more than 1100 then we consider it a desktop
        builder: (context, constraints) {
          return Scaffold(
            body: IndexedStack(children: pages, index: controller.tabIndex),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: AppTheme.whiteBackgroundColor,

                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppTheme.lightTextColor.withOpacity(0.2),
                    blurRadius: 30,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                unselectedLabelStyle: GoogleFonts.quicksand(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(66, 66, 66, 0.4),
                  height: 2,
                ),
                selectedLabelStyle: GoogleFonts.quicksand(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.lightPrimaryColor,
                  height: 2,
                ),
                selectedItemColor: AppTheme.lightPrimaryColor,
                backgroundColor: Colors.transparent, // Must be transparent here
                elevation: 0,
                iconSize: 16,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home, size: 22),
                    label: 'Home ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.group, size: 22),
                    label: 'Samaj ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled, size: 22),
                    label: 'Profile ',
                  ),
                ],
                onTap: (val) {
                  controller.changeTabIndex(val);
                },
                currentIndex: controller.tabIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}
