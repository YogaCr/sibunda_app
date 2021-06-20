import 'package:flutter/material.dart';

class HomeStatus {
  final String desc;
  final String imgLink;
  final Color color;

  HomeStatus({
    required this.desc,
    required this.imgLink,
    required this.color,
  });
}

class HomeMenu {
  final String name;
  final String imgLink;

  HomeMenu({
    required this.name,
    required this.imgLink,
  });
}

class HomeTips {
  final String desc;
  final String kind;
  final String imgLink;

  HomeTips({
    required this.desc,
    required this.kind,
    required this.imgLink,
  });
}