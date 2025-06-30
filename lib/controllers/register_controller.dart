import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallethunter/view/home/bottombar.dart';
import '../components/dailog_helper.dart';
import '../services/shared_pref_service.dart';
import '../view/auth/register_screen.dart' show ResgisterForm;
import '../view/auth/review.dart';

class RegisterController extends GetxController {
  int currentStep = 1;
  List samajList = [
    "Agarwal Samaj",
    "Brahmin Samaj",
    "Maratha Samaj",
    "Jain Oswal Samaj",
    "Jat Samaj",
    "Sindhi Samaj",
    "Other",
  ];
  @override
  void onInit() {
    super.onInit();
  }

  List genderList = ["Male", "Female", "Other"];
  List martialStatus = ["Single", "Married", "Divorced", "Widowed"];
  List relationOptions = [
    "Father",
    "Mother",
    "Husband",
    "Wife",
    "Son",
    "Daughter",
    "Brother",
    "Sister",
    "Grandfather",
    "Grandmother",
    "Uncle",
    "Aunt",
    "Cousin",
    "Other",
  ];
  // Profile Summary
  final nameController = TextEditingController();
  final releationController = TextEditingController();
  final lastNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final occupationController = TextEditingController();
  final samajController = TextEditingController();
  final qualificationController = TextEditingController();

  //  Personal Information
  final birthDateController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final dutiesController = TextEditingController();

  //  Contact Information
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final altPhoneController = TextEditingController();
  final landlineController = TextEditingController();
  final socialLinkController = TextEditingController();

  //  Address
  final flatController = TextEditingController();
  final buildingController = TextEditingController();
  final streetController = TextEditingController();
  final landmarkController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final stateController = TextEditingController();
  final nativeCityController = TextEditingController();
  final nativeStateController = TextEditingController();
  final countryController = TextEditingController();
  final pincodeController = TextEditingController();

  addFamilyMember() {
    clearForm();

    currentStep = 1;

    update();
    Get.to(
      () => ResgisterForm(
        key: UniqueKey(), // ✅ forces rebuild
        type: 2,
      ),
    );
  }

  submitFamilyMember() {
    String? storedData = PreferenceUtils.getString("headData");

    if (storedData != null) {
      // Decode existing data
      Map<String, dynamic> jsonData = json.decode(storedData);
      List<dynamic> members = jsonData['members'] ?? [];

      // Create new member data
      Map<String, dynamic> newMember = {
        // Profile Summary
        'name': nameController.text +middleNameController.text+lastNameController.text,
        'relation': releationController.text,
        'middleName': middleNameController.text,
        'lastName': lastNameController.text,
        'age': ageController.text,
        'path':profileImage==null?"": profileImage!.path,
        'gender': genderController.text,
        'maritalStatus': maritalStatusController.text,
        'occupation': occupationController.text,
        'samaj': samajController.text,
        'qualification': qualificationController.text,

        // Personal Information
        'birthDate': birthDateController.text,
        'bloodGroup': bloodGroupController.text,
        'duties': dutiesController.text,

        // Contact Information
        'email': emailController.text,
        'phone': phoneController.text,
        'altPhone': altPhoneController.text,
        'landline': landlineController.text,
        'socialLink': socialLinkController.text,

        // Address
        'flat': flatController.text,
        'building': buildingController.text,
        'street': streetController.text,
        'landmark': landmarkController.text,
        'city': cityController.text,
        'district': districtController.text,
        'state': stateController.text,
        'nativeCity': nativeCityController.text,
        'nativeState': nativeStateController.text,
        'country': countryController.text,
        'pincode': pincodeController.text,
      };

      members.add(newMember);

      jsonData['members'] = members;
      DialogHelper.showErroDialog(
        description: "Family Member added Successfully",
      );
      headDataResponse = jsonData;

      PreferenceUtils.setString("headData", json.encode(jsonData));
      update();
      Get.back();
      print("Member added successfully!");
    } else {
      print(" No existing headData found");
    }
  }

  void deleteMemberAtIndex(int index) {
    final storedData = PreferenceUtils.getString("headData");

    if (storedData != null) {
      final Map<String, dynamic> jsonData = json.decode(storedData);

      List<dynamic> members = jsonData['members'] ?? [];

      if (index >= 0 && index < members.length) {
        members.removeAt(index);
        jsonData['members'] = members;

        // Save updated data back
        PreferenceUtils.setString("headData", json.encode(jsonData));
        headDataResponse = jsonData;
        update();
        print(" Member at index $index deleted successfully.");
      } else {
        print("Invalid index: $index");
      }
    } else {
      print(" No headData found in SharedPreferences.");
    }
  }

  void clearForm() {
    nameController.clear();
    ageController.clear();
    lastNameController.clear();
    middleNameController.clear();
    releationController.clear();
    profileImage = null;
    genderController.clear();
    maritalStatusController.clear();
    occupationController.clear();
    samajController.clear();
    qualificationController.clear();

    birthDateController.clear();
    bloodGroupController.clear();
    dutiesController.clear();

    emailController.clear();
    phoneController.clear();
    altPhoneController.clear();
    landlineController.clear();
    socialLinkController.clear();

    flatController.clear();
    buildingController.clear();
    streetController.clear();
    landmarkController.clear();
    cityController.clear();
    districtController.clear();
    stateController.clear();
    nativeCityController.clear();
    nativeStateController.clear();
    countryController.clear();
    pincodeController.clear();
  }

  updateStep(index) {
    currentStep = index;
    update();
  }

  File? profileImage;
  Future getImage(ImageSource img) async {
    try {
      final image = await ImagePicker().pickImage(source: img);
      if (image == null) return;

      final imageTemp = File(image.path);

      if (image != null) {
        profileImage = File(image.path);
      }
      // setState(() {

      update();
    } on PlatformException catch (e) {
      print(e);
    }
  }

  finalSubmit() {  PreferenceUtils.saveUserToken("token");
    Get.offAll(BottomBar());
  }

  Map<String, dynamic> headDataResponse = {};
  void goToNextStep() {
    if (currentStep < 3) {
      currentStep++;
      update();
    } else {
      final Map<String, dynamic> headData = {
        // Profile Summary
        'name': nameController.text,
        'relation': "Self",
        'middleName': middleNameController.text,
        'lastName': lastNameController.text,
        'age': ageController.text,
        'gender': genderController.text,
        'maritalStatus': maritalStatusController.text,
        'occupation': occupationController.text,
        'samaj': samajController.text,
        'qualification': qualificationController.text,

        // Personal Information
        'birthDate': birthDateController.text,
        'bloodGroup': bloodGroupController.text,
        'duties': dutiesController.text,

        // Contact Information
        'email': emailController.text,
        'phone': phoneController.text,
        'altPhone': altPhoneController.text,
        'landline': landlineController.text,
        'socialLink': socialLinkController.text,

        // Address
        'flat': flatController.text,
        'building': buildingController.text,
        'street': streetController.text,
        'landmark': landmarkController.text,
        'city': cityController.text,
        'district': districtController.text,
        'state': stateController.text,
        'nativeCity': nativeCityController.text,
        'nativeState': nativeStateController.text,
        'country': countryController.text,
        'pincode': pincodeController.text,
        "members": [],
      };
      DialogHelper.showErroDialog(
        description: "Family Head added Successfully",
      );
      headDataResponse = headData;
      update();
      PreferenceUtils.setString("headData", json.encode(headData));
      Get.to(ReviewPage());
    }
  }
}
