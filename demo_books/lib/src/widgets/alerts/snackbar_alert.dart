
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:demo_books/src/theme/theme.dart' as th;
import 'package:demo_books/src/widgets/text/custom_text.dart';

class SnackBarAlert {

  static void cSnackBar(IconData _icon, String _txtSnack) {
    Get.rawSnackbar(
      backgroundColor: th.primaryColor,
      snackStyle: SnackStyle.GROUNDED,
      messageText: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_icon, color: Colors.white, size: 35.0),
            const SizedBox(width: 5.0),
            Flexible(
              child: CustomText(
                fTxt: _txtSnack, 
                fSize: 17.0,
                fAlign: TextAlign.justify,
                fColor: Colors.white,
              )
            )
          ]
        )
      )
    );
  }

}