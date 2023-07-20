// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.value,
    super.key,
  });

  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.general.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
