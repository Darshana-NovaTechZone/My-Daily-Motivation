import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class EmailVal {
  bool isValidEmail(String email) {
    // Regular expression for a simple email validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    return emailRegex.hasMatch(email);
  }

  msg(BuildContext context, String text) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: text,
      ),
    );
  }
}
