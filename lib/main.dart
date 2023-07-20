import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuntium/feature/home/home_view.dart';
import 'package:nuntium/product/constants/index.dart';
import 'package:nuntium/product/initialize/app_builder.dart';
import 'package:nuntium/product/initialize/app_theme.dart';
import 'package:nuntium/product/initialize/application_start.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => AppBuilder(child).build(),
      debugShowCheckedModeBanner: false,
      title: StringConstant.appName,
      theme: AppTheme(context).theme,
      home: const Scaffold(
        body: HomeView(),
      ),
    );
  }
}
