import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nuntium/product/constants/color_constant.dart';
import 'package:nuntium/product/enums/widget_size_enum.dart';
import 'package:nuntium/product/models/news.dart';
import 'package:nuntium/product/widgets/text/sub_title_text.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({
    required this.newsItem,
    super.key,
  });

  final News? newsItem;

  @override
  Widget build(BuildContext context) {
    if (newsItem == null) return const SizedBox.shrink();
    return Stack(
      children: [
        Padding(
          padding: context.padding.onlyRightNormal,
          child: Image.network(
            newsItem!.backroundImage ?? '',
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: context.padding.low,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: ColorConstant.white,
                    size: WidgetSize.iconNormal.value.toDouble(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: context.padding.normal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubtitleText(
                        value: newsItem!.category ?? '',
                        color: ColorConstant.grayLighter,
                      ),
                      Text(
                        newsItem!.title ?? '',
                        style: context.general.textTheme.titleSmall?.copyWith(
                          fontSize: 14,
                          color: ColorConstant.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
