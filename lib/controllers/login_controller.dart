import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallethunter/view/auth/otp_screen.dart';

import '../components/dailog_helper.dart';
import '../services/shared_pref_service.dart';
import '../view/home/bottombar.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    saveFamilyInfo();
  }

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  saveFamilyInfo() {
    PreferenceUtils().clearSharedPref() ;
    var familyjson = 
      {
        "name": "Rahul Kumar Patel",
        "path": "",
        "relation": "Self",
        "age": "42",
        "gender": "Male",
        "maritalStatus": "Married",
        "occupation": "Engineer",
        "samaj": "Patel Samaj",
        "qualification": "B.E.",
        "birthDate": "1982-01-01",
        "bloodGroup": "A+",
        "duties": "President",
        "email": "rahul@example.com",
        "phone": "9876543210",
        "altPhone": "9988776655",
        "landline": "0221234567",
        "socialLink": "@rahulpatel",
        "flat": "A-101",
        "building": "Silver Heights",
        "street": "MG Road",
        "landmark": "Near City Mall",
        "city": "Ahmedabad",
        "district": "Ahmedabad",
        "state": "Gujarat",
        "nativeCity": "Surat",
        "nativeState": "Gujarat",
        "country": "India",
        "pincode": "380001",
        "members": [
          {
            "name": "Rajni",
            "middleName": "",
            "lastName": "Patel",
            "path": "",
            "relation": "Wife",
            "age": "12",
            "gender": "Male",
            "maritalStatus": "Single",
            "occupation": "Student",
            "samaj": "Patel Samaj",
            "qualification": "5th Grade",
            "birthDate": "2012-06-01",
            "bloodGroup": "B+",
            "duties": "",
            "email": "",
            "phone": "",
            "altPhone": "",
            "landline": "",
            "socialLink": "",
            "flat": "A-101",
            "building": "Silver Heights",
            "street": "MG Road",
            "landmark": "Near City Mall",
            "city": "Ahmedabad",
            "district": "Ahmedabad",
            "state": "Gujarat",
            "nativeCity": "Surat",
            "nativeState": "Gujarat",
            "country": "India",
            "pincode": "380001",
          },
          {
            "name": "Anjali",
            "middleName": "",
            "lastName": "Patel",
            "path": "",
            "relation": "Daughter",
            "age": "10",
            "gender": "Female",
            "maritalStatus": "Single",
            "occupation": "Student",
            "samaj": "Patel Samaj",
            "qualification": "4th Grade",
            "birthDate": "2014-03-15",
            "bloodGroup": "O+",
            "duties": "",
            "email": "",
            "phone": "",
            "altPhone": "",
            "landline": "",
            "socialLink": "",
            "flat": "A-101",
            "building": "Silver Heights",
            "street": "MG Road",
            "landmark": "Near City Mall",
            "city": "Ahmedabad",
            "district": "Ahmedabad",
            "state": "Gujarat",
            "nativeCity": "Surat",
            "nativeState": "Gujarat",
            "country": "India",
            "pincode": "380001",
          },
           {
            "name": "Ram",
            "middleName": "",
            "lastName": "Patel",
            "path": "",
            "relation": "Son",
            "age": "10",
            "gender": "Male",
            "maritalStatus": "Single",
            "occupation": "Student",
            "samaj": "Patel Samaj",
            "qualification": "4th Grade",
            "birthDate": "2014-03-15",
            "bloodGroup": "O+",
            "duties": "",
            "email": "",
            "phone": "",
            "altPhone": "",
            "landline": "",
            "socialLink": "",
            "flat": "A-101",
            "building": "Silver Heights",
            "street": "MG Road",
            "landmark": "Near City Mall",
            "city": "Ahmedabad",
            "district": "Ahmedabad",
            "state": "Gujarat",
            "nativeCity": "Surat",
            "nativeState": "Gujarat",
            "country": "India",
            "pincode": "380001",
          },
           {
            "name": "Vikas",
            "middleName": "",
            "lastName": "Patel",
            "path": "",
            "relation": "Father",
            "age": "60",
            "gender": "Male",
            "maritalStatus": "Maried",
            "occupation": "Bussinies",
            "samaj": "Patel Samaj",
            "qualification": "4th Grade",
            "birthDate": "2014-03-15",
            "bloodGroup": "O+",
            "duties": "",
            "email": "",
            "phone": "",
            "altPhone": "",
            "landline": "",
            "socialLink": "",
            "flat": "A-101",
            "building": "Silver Heights",
            "street": "MG Road",
            "landmark": "Near City Mall",
            "city": "Ahmedabad",
            "district": "Ahmedabad",
            "state": "Gujarat",
            "nativeCity": "Surat",
            "nativeState": "Gujarat",
            "country": "India",
            "pincode": "380001",
          },
           {
            "name": "Rajesh",
            "middleName": "",
            "lastName": "Patel",
            "path": "",
            "relation": "Grand Father",
            "age": "90",
            "gender": "Male",
            "maritalStatus": "Maried",
            "occupation": "Bussinies",
            "samaj": "Patel Samaj",
            "qualification": "4th Grade",
            "birthDate": "2014-03-15",
            "bloodGroup": "O+",
            "duties": "",
            "email": "",
            "phone": "",
            "altPhone": "",
            "landline": "",
            "socialLink": "",
            "flat": "A-101",
            "building": "Silver Heights",
            "street": "MG Road",
            "landmark": "Near City Mall",
            "city": "Ahmedabad",
            "district": "Ahmedabad",
            "state": "Gujarat",
            "nativeCity": "Surat",
            "nativeState": "Gujarat",
            "country": "India",
            "pincode": "380001",
          },
        ],
      };
    
    if (PreferenceUtils.getString("headData") == null ||
        PreferenceUtils.getString("headData") == "") {
      PreferenceUtils.setString("headData", json.encode(familyjson));
      print("no data");
    } else {
      // PreferenceUtils.setString("headData", json.encode(familyjson));
    }
  }

  submitLogin() {
    Get.to(otpScreen());
  }

  String? verificationIds;
  bool otpSent = false;
  void sendOTP() async {
    DialogHelper.showLoading();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        DialogHelper.hideLoading();
        DialogHelper.showErroDialog(description: "Mobile no. not registered");
        print("Verification failed: ${e.message}");
      },
      timeout: const Duration(seconds: 30), // Optional: reduce waiting time

      codeSent: (String verificationId, int? resendToken) {
        print(verificationId);
        DialogHelper.hideLoading();
        verificationIds = verificationId;
        update();
        otpSent = true;
        DialogHelper.showErroDialog(description: "OTP sent Successfully");
        otpController.clear();
        Get.to(otpScreen());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
      },
    );
  }

  void verifyOTP() async {
    DialogHelper.showLoading();
    // final credential = PhoneAuthProvider.credential(
    //   verificationId: verificationIds!,
    //   smsCode: otpController.text,
    // );

    try {
      if (otpController.text == "123456") {
        DialogHelper.hideLoading();
        PreferenceUtils.saveUserToken("token");
        DialogHelper.showErroDialog(description: "Login Successfully");
        Get.offAll(BottomBar());
      } else {
        DialogHelper.hideLoading();
        DialogHelper.showErroDialog(description: "Invalid OTP");
      }
      //  await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      DialogHelper.showErroDialog(description: "Invalid OTP");
      print("Invalid OTP");
    }
  }
}
