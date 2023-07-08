import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CollectionReference news = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: news.get(),
        // ignore: strict_raw_type
        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
          return const Card();
        },
      ),
    );
  }
}
