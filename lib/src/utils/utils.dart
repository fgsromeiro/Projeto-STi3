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
      {Color colorRow = Colors.black}) {
    return TableRow(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.base))),
      children: [
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(AppColors.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Center(
            child: Text(
              id,
              style: TextStyle(
                fontSize: 13,
                color: colorRow,
              ),
            ),
          ),
        ),
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(AppColors.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              date,
              style: TextStyle(
                fontSize: 13,
                color: colorRow,
              ),
            ),
          ),
        ),
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(AppColors.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              client,
              style: TextStyle(
                fontSize: 13,
                color: colorRow,
              ),
            ),
          ),
        ),
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(AppColors.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Center(
            child: Text(
              status,
              style: TextStyle(
                fontSize: 13,
                color: colorRow,
              ),
            ),
          ),
        ),
        TableRowInkWell(
          overlayColor: WidgetStatePropertyAll<Color>(AppColors.primary),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: colorRow,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
