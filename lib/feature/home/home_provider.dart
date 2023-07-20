// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nuntium/product/models/news.dart';
import 'package:nuntium/product/models/recomanded.dart';
import 'package:nuntium/product/models/tag.dart';
import 'package:nuntium/product/utility/firebase/firebase_collections.dart';
import 'package:nuntium/product/utility/firebase/firebase_utility.dart';

class HomeNotifier extends StateNotifier<HomeState> with FirebaseUtility {
  HomeNotifier() : super(const HomeState());

  List<Tag> _fullTagList = [];
  List<Tag> get fullTagList => _fullTagList;

  Future<void> fetchNews() async {
    final items =
        await fetchList<News, News>(const News(), FirebaseCollections.news);
    state = state.copyWith(news: items);
  }

  Future<void> fetchTags() async {
    final items =
        await fetchList<Tag, Tag>(const Tag(), FirebaseCollections.tag);
    state = state.copyWith(tags: items);
    _fullTagList = items ?? [];
  }

  Future<void> fetchRecommended() async {
    final items = await fetchList<Recommended, Recommended>(
      const Recommended(),
      FirebaseCollections.recommended,
    );

    state = state.copyWith(recommendeds: items);
  }

  Future<void> fetchAndLoad() async {
    state = state.copyWith(isLoading: true);
    await Future.wait([fetchNews(), fetchTags(), fetchRecommended()]);
    state = state.copyWith(isLoading: false);
  }

  void updateSelectedTag(Tag? tag) {
    if (tag == null) return;
    state = state.copyWith(selecetedTag: tag);
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.news,
    this.tags,
    this.isLoading,
    this.recommendeds,
    this.selecetedTag,
  });

  final List<News>? news;
  final List<Tag>? tags;
  final bool? isLoading;
  final List<Recommended>? recommendeds;
  final Tag? selecetedTag;

  @override
  List<Object?> get props =>
      [news, tags, isLoading, recommendeds, selecetedTag];

  HomeState copyWith({
    List<News>? news,
    List<Tag>? tags,
    bool? isLoading,
    List<Recommended>? recommendeds,
    Tag? selecetedTag,
  }) {
    return HomeState(
      news: news ?? this.news,
      tags: tags ?? this.tags,
      isLoading: isLoading ?? this.isLoading,
      recommendeds: recommendeds ?? this.recommendeds,
      selecetedTag: selecetedTag ?? this.selecetedTag,
    );
  }
}
