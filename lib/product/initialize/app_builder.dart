import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppBuilder {
  AppBuilder(this.child);

  final Widget? child;

  Widget build() {
    return ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: child!,
    );
  }
}
