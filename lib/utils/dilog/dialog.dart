import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> showConfirmDialog<T>(String title,
    {String positiveTitle = 'OK', String negativeTitle = 'CANCEL'}) {
  return Get.dialog(CupertinoAlertDialog(
    title: Text(title),
    actions: [
      if (positiveTitle != null)
        CupertinoButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: Text(positiveTitle),
        ),
      if (negativeTitle != null)
        CupertinoButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: Text(negativeTitle),
        )
    ],
  ));
}
