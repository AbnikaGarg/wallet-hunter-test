import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showExportOptions({required VoidCallback onPdfTap, required VoidCallback onImageTap}) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Export Family Tree", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Icon(Icons.picture_as_pdf, color: Colors.red),
            title: Text("Export as PDF"),
            onTap: () {
              Get.back(); // Close sheet
              onPdfTap();
            },
          ),
          ListTile( contentPadding: EdgeInsetsDirectional.zero,
            leading: Icon(Icons.image, color: Colors.blue),
            title: Text("Export as Image"),
            onTap: () {
              Get.back(); // Close sheet
              onImageTap();
            },
          ),
          SizedBox(height: 30,)
        ],
      ),
    ),
  );
}
