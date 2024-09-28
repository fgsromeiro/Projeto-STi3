import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/utils/styles.dart';
import 'package:projeto_sti3/src/utils/utils.dart';

class Dialogs {
  static void showSnackBarMessage(
    BuildContext context, {
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 13,
                  color: Styles.tertiary,
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              style: ElevatedButton.styleFrom(overlayColor: Colors.transparent),
              child: Text(
                'FECHAR X',
                style: TextStyle(
                  fontSize: 13,
                  color: Styles.tertiary,
                ),
              ))
        ],
      ),
      duration: const Duration(seconds: 5),
      backgroundColor: Styles.primary,
      margin: EdgeInsets.symmetric(
        horizontal: Utils.widthSize(context) * 0.03,
        vertical: Utils.widthSize(context) * 0.01,
      ),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
