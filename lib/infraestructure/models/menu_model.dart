import 'package:flutter/material.dart';

class MenuModel {
  final String path;
  final String title;
  final String subTitle;
  final IconData? icon;

  MenuModel({
    required this.path,
    required this.title,
    required this.subTitle,
    this.icon,
  });
}
