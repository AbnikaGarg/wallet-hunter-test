import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallethunter/controllers/register_controller.dart';
import 'package:wallethunter/theme/app_colors.dart';
import 'package:wallethunter/view/auth/components/personal_form.dart';

import '../../components/button.dart';
import '../../components/dailog_helper.dart';
import '../../components/multiline_textbox.dart';
import '../../components/user_input_field.dart';
import 'components/address_form.dart';
import 'components/contact_form.dart';

class ResgisterForm extends StatelessWidget {
  ResgisterForm({super.key, required this.type});
  final int type;
  final _controller = Get.put(RegisterController()); //<---
  final personalFormKey = GlobalKey<FormState>();
  final contactFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();

  Future<bool> onwillpoo() async {
    DialogHelper.showAlertDialog(() {
      Get.back();
      Get.back();

      /// Get.offAllNamed(Routes.HOME, parameters: {'pageIndex': "1"});
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onwillpoo(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.whiteBackgroundColor,
          title: Text(
            type == 1 ? "Head Registration" : "Family Member Registration",
          ),
        ),

        body: GetBuilder<RegisterController>(
          builder: (controller) {
            return Column(
              children: [
                SizedBox(height: 10),
                buildHeaderRow(context, controller.currentStep),
                SizedBox(height: 10),
                buildStepContent(controller.currentStep, context),
                //  buildAddressForm(context),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    bottom: 40,
                    right: 20,
                  ),
                  child: ResuableButton(
                    ontap: () {
                      // Get.to(otpScreen());
                      // if (LoginformKey2.currentState!.validate()) {
                      //   _controller.login();
                      // } else {
                      //   _controller.autoValidateClick();
                      // }

                      if (controller.currentStep == 1 &&
                          personalFormKey.currentState!.validate()) {
                        controller.goToNextStep();
                      } else if (controller.currentStep == 2 &&
                          contactFormKey.currentState?.validate() == true) {
                        controller.goToNextStep();
                      } else if (controller.currentStep == 3 &&
                          addressFormKey.currentState?.validate() == true) {
                        // All steps valid, maybe submit or review
                        print("All forms valid");
                        if (type == 1) {
                          controller.goToNextStep();
                        } else {
                          controller.submitFamilyMember();
                        }
                      }
                    },
                    textcolor: const Color(0xFFFFFFFF),
                    title: "Continue",
                    fontweigth: FontWeight.w700,

                    color: AppTheme.lightPrimaryColor,

                    height: 50,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildStepContent(currentStep, context) {
    switch (currentStep) {
      case 1:
        return buildPersonalForm(context, _controller, personalFormKey, type);
      case 2:
        return buildContactForm(context, _controller, contactFormKey);
      case 3:
        return buildAddressForm(context, _controller, addressFormKey);
      default:
        return Text("Complete step");
    }
  }

  Widget buildHeaderRow(BuildContext context, int currentStep) {
    Widget stepItem(int stepNumber, String label) {
      bool isCompleted = stepNumber < currentStep;
      bool isCurrent = stepNumber == currentStep;

      return Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isCompleted || isCurrent
                  ? AppTheme.lightPrimaryColor
                  : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            height: 20,
            width: 20,
            child: Center(
              child: isCompleted
                  ? Icon(
                      Icons.check,
                      size: 14,
                      color: AppTheme.whiteBackgroundColor,
                    )
                  : Text(
                      "$stepNumber",
                      style: GoogleFonts.inter(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                        color: isCurrent
                            ? AppTheme.whiteBackgroundColor
                            : Colors.black,
                      ),
                    ),
            ),
          ),
          Text(
            "  $label  ",
            style: GoogleFonts.inter(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: AppTheme.blackColor,
            ),
          ),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      decoration: BoxDecoration(color: AppTheme.backGround),
      child: Row(
        children: [
          stepItem(1, "Personal"),
          Expanded(child: Divider()),
          stepItem(2, "Contact"),
          Expanded(child: Divider()),
          stepItem(3, "Address"),
        ],
      ),
    );
  }
}
