import 'package:flutter/material.dart';
import 'package:simbo/presentation/utils/constants.dart';

Widget appTextForm({
  required String hintTitle,
  TextEditingController? controller,
  TextInputType? type,
  bool obscureText = false,
}){
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 50,
    ),
    child: TextFormField(
      controller: controller,
      style: const TextStyle(color: appThemeColor),
      decoration: InputDecoration(
        hintText: hintTitle,
        hintStyle: const TextStyle(color: appThemeColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: appThemeColor,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: appThemeColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: appThemeColor,
            width: 3,
          ),
        ),
      ),
      keyboardType: type,
      obscureText: obscureText,
    ),
  );
}