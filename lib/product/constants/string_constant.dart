import 'package:flutter/material.dart';

@immutable
class StringConstant {
  const StringConstant._();
  static const String appName = 'Nuntium';

  //Login
  static const String loginWelcomeBack = 'Welcome Back 👋';
  static const String loginDescription =
      'I am happy to see you again. You can continue where you left off by logging in';
  static const String contiuneApp = 'Contiune to app';

  //HomeView
  static const String homeBrowse = 'Browse';
  static const String homeDescription = 'Discover things of this world';
  static const String homeRecommended = 'Recommended for you';
  static const String homeSeeAll = 'See All';
  static const String homeSearch = 'Search';
  static const String homeHorizontalTitle = 'POLITICS';
  static const String homehorizontalDescription =
      'The latest situation in the presidential election';

  //Component
  static const String dropdownHint = 'Select Category';
  static const String textfieldTitle = 'Title';
  static const String buttonCreate = 'Create';
  static const String addNewItem = 'Add New Item';
}
