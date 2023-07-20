import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nuntium/product/enums/image_size_enum.dart';
import 'package:nuntium/product/models/recomanded.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    required this.recommended,
    super.key,
  });

  final Recommended? recommended;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        children: [
          Image.network(
            recommended?.image ?? '',
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
            height: ImageSize.normal.value.toDouble(),
          ),
          Expanded(
            child: ListTile(
              title: Text(recommended?.title ?? ''),
              subtitle: Text(
                recommended?.description ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
