import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class Utils {
  static double heightSize(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double widthSize(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static TableRow tableRowChild(
    BuildContext context,
    String id,
    String date,
    String client,
    String status,
    String value,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
  ) {
    return TableRow(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Styles.base))),
      children: [
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(Styles.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Center(
            child: Text(
              id,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(Styles.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Center(
            child: Text(
              date,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(Styles.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Center(
            child: Text(
              client,
              style: const TextStyle(),
            ),
          ),
        ),
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(Styles.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Center(
            child: Text(
              status,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(Styles.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}
