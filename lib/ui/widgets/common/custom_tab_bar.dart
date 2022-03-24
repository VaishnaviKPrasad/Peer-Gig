import 'package:flutter/material.dart';

class CustomTabBar extends TabBar {
  final int length;
  final List<Widget> customTabs;
  const CustomTabBar({required this.length, required this.customTabs, Key? key})
      : super(tabs: customTabs, key: key);
}
