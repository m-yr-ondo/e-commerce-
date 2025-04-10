
import 'package:flutter/material.dart';
import 'package:login/configs/mycolors.dart';

Widget myButton(VoidCallback work, {required String label, Color color = mainColor}) {
  return MaterialButton(
    onPressed: work,
    color: color,
    minWidth: 300,
    child: Text(label),
  );
}