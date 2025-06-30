import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';


class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error', String? description = 'Try again later'}) {
    HapticFeedback.lightImpact();
    Fluttertoast.showToast(
        msg: description!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: AppTheme.whiteBackgroundColor,
        textColor: Colors.black,
        fontSize: 16.0);
    
  }

  hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void showSuccess({String? description = 'Saved Successfully'}) {
    HapticFeedback.lightImpact();
    Get.showSnackbar(
      GetSnackBar(
        snackStyle: SnackStyle.GROUNDED,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.bounceOut,
        //padding: EdgeInsets.all(5),

        duration: Duration(seconds: 4),
        isDismissible: true,

        overlayColor: Colors.black,
        backgroundColor: Colors.green,
        messageText: Text(
          description.toString(),
          textAlign: TextAlign.center,
          style: Get.theme.textTheme.headlineMedium!
              .copyWith(color: AppTheme.whiteBackgroundColor),
        ),
        // forwardAnimationCurve: Curves.easeIn,
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  static void showAlertDialog(VoidCallback onTap,
      {String? title = 'Are you sure you want to discard changes you made?'}) {
    Get.dialog(
      //  context: Get.context,//
      CupertinoAlertDialog(
        title: const Text('Discard Changes'),
        insetAnimationCurve: Curves.linear,
        insetAnimationDuration: Duration(milliseconds: 500),
        content: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(title!),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Get.back();
            },
            child: const Text('Keep'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: onTap,
            child: const Text('Discard'),
          ),
        ],
      ),
    );
  }

 
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(50)),
            width: 60,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CupertinoActivityIndicator(
                color: AppTheme.lightPrimaryColor,
                radius: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showErroDialog2(
      {String title = 'Error', String? description = 'Try again later'}) {
    HapticFeedback.lightImpact();
    Get.showSnackbar(
      GetSnackBar(
        icon: Icon(
          Icons.close_sharp,
        ),
        //  snackStyle: SnackStyle.ce,
        reverseAnimationCurve: Curves.easeInBack,
        forwardAnimationCurve: Curves.ease,
        //padding: EdgeInsets.all(5),
        animationDuration: Duration(milliseconds: 300),
        duration: Duration(seconds: 3),
        isDismissible: true,

        //overlayColor: Colors.black,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        messageText: Text(description.toString(),
            style: Get.theme.textTheme.headlineMedium!),
        // forwardAnimationCurve: Curves.easeIn,
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
