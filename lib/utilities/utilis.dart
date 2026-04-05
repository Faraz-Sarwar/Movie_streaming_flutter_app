import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/theme/app_colors.dart';

class Utilis {
  static void showMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
