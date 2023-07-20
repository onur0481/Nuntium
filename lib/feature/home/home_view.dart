// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import 'package:nuntium/feature/home/home_provider.dart';
import 'package:nuntium/feature/home/sub_view/home_search_delegate.dart';
import 'package:nuntium/product/constants/index.dart';
import 'package:nuntium/product/models/tag.dart';
import 'package:nuntium/product/widgets/card/home_news_card.dart';
import 'package:nuntium/product/widgets/card/home_recommended_card.dart';
import 'package:nuntium/product/widgets/text/sub_title_text.dart';
import 'package:nuntium/product/widgets/text/title_text.dart';

part './sub_view/home_chips.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(_homeProvider.notifier).fetchAndLoad();
    });
    ref.read(_homeProvider.notifier).addListener((state) {
      if (state.selecetedTag != null) {
        _controller.text = state.selecetedTag?.name ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              padding: context.padding.normal,
              children: [
                const _Header(),
                _CustomField(_controller),
                const _TagListView(),
                const _BrowseHorizontalListview(),
                const _RecommendedHeader(),
                const _RecommendedListView(),
              ],
            ),
            if (ref.watch(_homeProvider).isLoading ?? false)
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}

class _CustomField extends ConsumerWidget {
  const _CustomField(
    this.controller,
  );
  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      onTap: () async {
        final response = await showSearch<Tag?>(
          context: context,
          delegate: HomeSearchDelegate(
            ref.read(_homeProvider.notifier).fullTagList,
          ),
        );
        ref
            .read(_homeProvider.notifier)
            .updateSelectedTag(response ?? const Tag());
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.mic_outlined),
        fillColor: ColorConstant.grayLighter,
        filled: true,
        hintText: StringConstant.homeSearch,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _TagListView extends ConsumerWidget {
  const _TagListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagItems = ref.watch(_homeProvider).tags ?? [];
    return SizedBox(
      width: context.sized.width,
      height: context.sized.dynamicHeight(.1),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tagItems.length,
        itemBuilder: (context, index) {
          final tagItem = tagItems[index];
          if (tagItem.active ?? false) {
            return _ActiveChip(tagItem);
          }
          return _PassiveChip(tagItem);
        },
      ),
    );
  }
}

class _BrowseHorizontalListview extends ConsumerWidget {
  const _BrowseHorizontalListview();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItem = ref.watch(_homeProvider).news;
    return SizedBox(
      height: context.sized.dynamicHeight(.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsItem?.length ?? 0,
        itemBuilder: (context, index) {
          return HomeNewsCard(newsItem: newsItem?[index]);
        },
      ),
    );
  }
}

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: TitleText(value: StringConstant.homeRecommended),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(StringConstant.homeSeeAll),
          )
        ],
      ),
    );
  }
}

class _RecommendedListView extends ConsumerWidget {
  const _RecommendedListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedItems = ref.watch(_homeProvider).recommendeds ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: recommendedItems.length,
      itemBuilder: (context, index) {
        return RecommendedCard(
          recommended: recommendedItems[index],
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(value: StringConstant.homeBrowse),
        Padding(
          padding: context.padding.onlyTopLow,
          child: const SubtitleText(value: StringConstant.homeDescription),
        ),
      ],
    );
  }
}
