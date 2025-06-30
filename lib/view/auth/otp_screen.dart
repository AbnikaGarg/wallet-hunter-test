import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:wallethunter/view/home/bottombar.dart';

import '../../components/button.dart';
import '../../controllers/login_controller.dart';
import '../../theme/app_colors.dart';

class otpScreen extends StatelessWidget {
  otpScreen({super.key});

  final controller = Get.put<LoginController>(LoginController());
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<LoginController>(
        builder: (_controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/otp.png", height: 200),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(12),
                      // ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Enter Otp",
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "We’ve sent a verification code to your mobile",
                              style: GoogleFonts.inter(
                                color: AppTheme.lightTextColor,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 30),
                            Center(
                              child: Pinput(
                                controller: _controller.otpController,
                                length: 6,
                                autofocus: true,
                                forceErrorState: true,
                                onCompleted: (pin) => print(pin),
                                defaultPinTheme: PinTheme(
                                  width: 40,
                                  height: 40,
                                  textStyle: TextStyle(fontSize: 18),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff585A60).withOpacity(0.4),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
                                validator: (pin) {
                                  if (pin!.length >= 6) return null;
                                  return 'Enter Valid OTP';
                                },
                              ),
                            ),
                            SizedBox(height: 60),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: ResuableButton(
                                title: "Verify Code",
                                ontap: () {
                                  if (formkey.currentState!.validate()) {
                                    _controller.verifyOTP();
                                   
                                  }
                                },
                                textcolor: AppTheme.whiteBackgroundColor,
                                color: AppTheme.lightPrimaryColor,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Didn't receive OTP? ",
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(color: AppTheme.blackColor),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    " Resend",
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
