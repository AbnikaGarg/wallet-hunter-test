import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/shared_pref_service.dart';

class BottomBarController extends GetxController {
  final parameters = Get.parameters;
  void changeTabIndex(int index) {
    tabIndex = index;
    debugPrint(index.toString());
    update();
  }

  var tabIndex = 0;
  @override
  void onInit() {
    super.onInit();

    getFamilyData();
  }

  updateBack() {
    tabIndex = 0;
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var familyMember;
  getFamilyData() {
    final rawJson = PreferenceUtils.getString('headData') ?? '';
    familyMember = jsonDecode(rawJson);
    update();
  }

  final Map<String, List<Map<String, String>>> samajTempleMap = {
    "Agarwal Samaj": [
      {"name": "Shree Agrasen Dham", "location": "Delhi"},
      {"name": "Agrasen Temple", "location": "Vrindavan"},
    ],
    "Brahmin Samaj": [
      {"name": "Brahma Mandir", "location": "Pushkar"},
      {"name": "Ved Mandir", "location": "Nashik"},
    ],
    "Maratha Samaj": [
      {"name": "Shiv Mandir", "location": "Kolhapur"},
      {"name": "Bhavani Temple", "location": "Tuljapur"},
    ],
    "Jain Oswal Samaj": [
      {"name": "Mahavir Jain Temple", "location": "Mumbai"},
      {"name": "Oswal Jain Mandir", "location": "Ahmedabad"},
    ],
    "Jat Samaj": [
      {"name": "Jat Dharamshala Mandir", "location": "Hisar"},
      {"name": "Veer Teja Temple", "location": "Nagaur"},
    ],
    "Sindhi Samaj": [
      {"name": "Jhulelal Mandir", "location": "Ulhasnagar"},
      {"name": "Sai Dham", "location": "Raipur"},
    ],
    "Other": [
      {"name": "Community Temple", "location": "City Center"},
    ],
  };
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
        familyMember = jsonData;
        update();
        print(" Member at index $index deleted successfully.");
      } else {
        print("Invalid index: $index");
      }
    } else {
      print(" No headData found in SharedPreferences.");
    }
  }
}
