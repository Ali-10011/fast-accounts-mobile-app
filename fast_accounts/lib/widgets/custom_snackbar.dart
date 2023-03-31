import 'package:flutter/material.dart';

//fires a custom snackbar where it is called
void roundSnackbar(
    {required BuildContext buildContext,
    required Color snackbarColor,
    required String snackbarMessage,
    required Color textColor}) {
  ScaffoldMessenger.of(buildContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(buildContext).showSnackBar(
    SnackBar(
      backgroundColor: snackbarColor,
      content: Text(
        snackbarMessage,
        style: TextStyle(color: textColor),
      ),
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
