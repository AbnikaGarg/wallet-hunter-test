import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class ModalSheet {
  static void showModal(
    context,
    List items,
    final ValueChanged<String> update,
    [
    String? selValue,
  ]) {
    String? val;
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      // useSafeArea: true,
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (() {
            //  Navigator.of(context).pop();
          }),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon(
                  //   Icons.remove,
                  //   color: Colors.grey[600],
                  //   size: 40,
                  // ),
                  SizedBox(height: 10),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(height: 15),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                items[index],
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(fontSize: 15),
                              ),
                              if (items[index] == selValue)
                                Icon(
                                  CupertinoIcons.checkmark,
                                  size: 24,
                                  color: Colors.blue,
                                ),
                            ],
                          ),
                        ),
                        onTap: () {
                        //  indexselct(index);
                          update(items[index]);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
