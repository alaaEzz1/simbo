import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simbo/presentation/utils/constants.dart';

Widget homeShowMore({
  required String title,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: appThemeColor),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: (){

            },
            child: const Text(
              "show more",
              style: TextStyle(
                fontSize: 16,
                color: appThemeColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
