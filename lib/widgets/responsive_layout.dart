// /widgets/responsive_layout.dart

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  ResponsiveLayout({
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width > 1200 && desktop != null) {
      return desktop!;
    } else if (width > 800 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
