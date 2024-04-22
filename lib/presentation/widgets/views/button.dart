import 'package:flutter/material.dart';
import 'package:simbo/presentation/utils/constants.dart';

Widget appButtonStyle({
  required String title,
  Function()? function,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: ElevatedButton(
      onPressed: function,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      
      style: ElevatedButton.styleFrom(
        backgroundColor: appThemeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 8,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
