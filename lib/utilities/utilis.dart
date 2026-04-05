import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/theme/app_colors.dart';

class Utilis {
  static void showMessage(String message, IconData icon) {
    Fluttertoast.showToast(
      msg: '$icon $message',
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
