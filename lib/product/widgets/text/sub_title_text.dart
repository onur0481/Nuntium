// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    required this.value,
    super.key,
    this.color,
  });

  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.general.textTheme.titleMedium?.copyWith(
        color: color,
      ),
    );
  }
}
