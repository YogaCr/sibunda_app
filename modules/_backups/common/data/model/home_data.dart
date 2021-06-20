import 'package:flutter/material.dart';

class Profile {
  final String name;
  final int age; //in year
  final String imgLink; //in year

  Profile({
    required this.name,
    required this.age,
    required this.imgLink,
  });
}

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