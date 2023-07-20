import 'package:flutter/material.dart';
import 'package:nuntium/product/models/tag.dart';

// ignore: strict_raw_type
class HomeSearchDelegate extends SearchDelegate<Tag?> {
  HomeSearchDelegate(this.tagItems);

  final List<Tag> tagItems;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = tagItems.where(
      (element) =>
          element.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(results.elementAt(index).name ?? ''),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = tagItems.where(
      (element) =>
          element.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              close(
                context,
                results.elementAt(index),
              );
            },
            title: Text(results.elementAt(index).name ?? ''),
          ),
        );
      },
    );
  }
}
