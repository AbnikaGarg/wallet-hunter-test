import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallethunter/components/button.dart';
import 'package:wallethunter/controllers/login_controller.dart';
import 'package:wallethunter/theme/app_colors.dart';

import '../../components/user_input_field.dart';
import 'otp_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final _unfocusNode = FocusNode();
  final LoginformKey2 = GlobalKey<FormState>();
  final _controller = Get.put(LoginController()); //<---
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            resizeToAvoidBottomInset: false,

            body: Form(
              key: LoginformKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      color: AppTheme.backGround2,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width,
                          80.0,
                        ),
                      ),
                    ),
                    child: SvgPicture.asset(
                      fit: BoxFit.contain,
                      "assets/icons/scene-2.svg",
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome back ",
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Image.asset("assets/icons/wave.png", height: 30),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Login with your mobile number",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.lightTextColor,
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Text(
                        //   "Mobile No.",
                        //   style: GoogleFonts.inter(
                        //     fontSize: 14,
                        //     fontWeight: FontWeight.w500,
                        //     color: AppTheme.blackColor,
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                        MyTextField(
                          textEditingController: controller.phoneController,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Mobile no. is required";
                            }
                            if (value.length != 10) {
                              return 'Mobile Number must be of 10 digit';
                            }
                            return null;
                          },

                          preicon: Icon(CupertinoIcons.phone),
                          hintText: "Enter Mobile No. ",
                          textInputType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          color: const Color(0xff585A60),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 20,
                            right: 20,
                          ),
                          child: ResuableButton(
                            ontap: () {
                              //  Get.to(otpScreen());
                              if (LoginformKey2.currentState!.validate()) {
                                _controller.sendOTP();
                              } else {}
                            },
                            textcolor: const Color(0xFFFFFFFF),
                            title: "Login",
                            fontweigth: FontWeight.w700,

                            color: AppTheme.lightPrimaryColor,

                            height: 50,
                          ),
                        ),

                        SizedBox(height: 25),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't have an account? ",
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(color: AppTheme.blackColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(ResgisterForm(type: 1));
                              },
                              child: Text(
                                " Register",
                                style: GoogleFonts.inter(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.linkColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
